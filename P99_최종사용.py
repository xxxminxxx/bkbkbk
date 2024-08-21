# 필요한 라이브러리 연결
import pandas as pd
import mysql.connector
from sqlalchemy import create_engine

# [1. MySQL 데이터 베이스 연결]

# MySQL 연결 설정
db_config = {
    'host': '192.168.',
    'user': 'final',
    'password': 'final',
    'database': 'final1'
}

# SQLAlchemy 엔진 생성
engine = create_engine(f"mysql+mysqlconnector://{db_config['user']}:{db_config['password']}@{db_config['host']}/{db_config['database']}")

# 1. 사용자 메모 데이터 수집
def collect_user_memos():
    query = """
            SELECT  m.memoNum, 
                    m.userNum, 
                    m.shelfNum, 
                    m.memoContent, 
                    m.memoDate,
                    b.bookNum, 
                    bs.rating
            FROM    memo m
                    INNER JOIN bookshelf bs
                        ON m.shelfNum = bs.shelfNum
                    INNER JOIN book b
                        ON bs.bookNum = b.bookNum
            """
    user_memos = pd.read_sql(query, engine)
    return user_memos

# 2. 도서 메타데이터 수집 ( 카테고리와 조인 )
def collect_book_metadata_with_category():
    query = """
            SELECT  b.bookNum,
                    b.bookTitle,
                    b.writer,
                    b.bookPreview,
                    c.cateNum,
                    c.1depth,
                    c.2depth,
                    c.3depth
            FROM    book b
                    LEFT JOIN category c
                        ON b.cateNum = c.cateNum
            """
    book_metadata = pd.read_sql(query, engine)
    return book_metadata

# 3. 사용자 관심사 데이터 수집
def collect_user_interests():
    query = """
    SELECT  userNum,
            userId,
            interestHobby
    FROM    users
    """
    user_interests_df = pd.read_sql(query, engine)
    return user_interests_df


# 초기 사용자 프로필 생성 함수
def create_initial_profile(user_interests):
    # 사용자별 관심사를 딕셔너리 형태로 변환
    user_profiles = {}
    # user_interests_df의 각 행에 대해 반복하되, 인덱스는 무시(_)하고 행 데이터(row)만 사용
    for _, row in user_interests.iterrows():
        userNum = int(row['userNum'])  # userNum을 정수형으로 변환
        userId = row['userId']
        interest_hobby = row['interestHobby']

        # None 값 처리
        if pd.isna(interest_hobby):
            interests = []
        else:
            interests = interest_hobby.split(',')  # 콤마로 구분된 관심사를 리스트로 변환
            interests = [interest.strip() for interest in interests]  # 각 관심사 앞뒤 공백 제거

        # 만약 해당 userNum의 초기 사용자 프로필이 없다면
        if userNum not in user_profiles:
            # 초기 사용자 프로필 생성
            user_profiles[userNum] = {
                'userNum': userNum,
                'userId': userId,
                'interests': [],
                'interest_count': 0
            }
        # 초기 사용자 프로필에 interests 추가
        user_profiles[userNum]['interests'].extend(interests)
        user_profiles[userNum]['interest_count'] = len(user_profiles[userNum]['interests'])

    # 딕셔너리를 데이터프레임으로 변환
    user_profiles_df = pd.DataFrame.from_dict(user_profiles, orient='index')

    # 'interests' 컬럼을 문자열로 변환 (데이터프레임에서 리스트를 직접 저장할 수 없으므로)
    user_profiles_df['interests'] = user_profiles_df['interests'].apply(lambda x: ','.join(x))

    return user_profiles_df

# 4. 사용자 메모, 도서, 관심사 데이터 통합
def integrate_dataframes(user_memos, book_metadata, user_profiles):

    # 1. 모든 사용자 프로필을 기준으로 시작
    final_df = user_profiles.copy()

    # 2. 사용자 메모와 도서 메타데이터 결합
    memo_book_df = pd.merge(user_memos, book_metadata, on='bookNum', how='outer')

    # 3. 모든 사용자 프로필에 메모와 책 정보 추가 (없으면 NaN)
    final_df = pd.merge(final_df, memo_book_df, on='userNum', how='left')

    # 4. 필요한 컬럼만 선택 (필요에 따라 조정 가능)
    columns_to_keep = [
        'userNum', 'userId', 'interests', 'interest_count',
        'memoNum', 'bookNum', 'bookTitle', 'writer', 'bookPreview',
        'memoContent', 'memoDate', 'shelfNum', 'cateNum', '1depth', '2depth', '3depth',
        'rating'
    ]
    final_df = final_df[columns_to_keep]

    # 5. 결측치 처리
    final_df['interests'] = final_df['interests'].fillna('')
    final_df['interest_count'] = final_df['interest_count'].fillna(0)
    final_df['memoContent'] = final_df['memoContent'].fillna('')
    final_df['memoDate'] = final_df['memoDate'].fillna(pd.NaT)
    final_df['rating'] = final_df['rating'].fillna(0)
    final_df['bookNum'] = final_df['bookNum'].fillna(0)
    final_df['memoNum'] = final_df['memoNum'].fillna(0)
    final_df['shelfNum'] = final_df['shelfNum'].fillna(0)
    final_df['cateNum'] = final_df['cateNum'].fillna(0)
    final_df['bookTitle'] = final_df['bookTitle'].fillna('')
    final_df['writer'] = final_df['writer'].fillna('')
    final_df['bookPreview'] = final_df['bookPreview'].fillna('')
    final_df['1depth'] = final_df['1depth'].fillna('')
    final_df['2depth'] = final_df['2depth'].fillna('')
    final_df['3depth'] = final_df['3depth'].fillna('')

    return final_df

# 데이터 수집 및 통합 실행
user_memos = collect_user_memos()                             # memo 테이블 - 데이터베이스 자체
book_metadata = collect_book_metadata_with_category()         # book 테이블 - 데이터베이스 자체
user_interests = collect_user_interests()                     # user 테이블 - 데이터베이스 자체

# 초기 프로필 생성
initial_profiles = create_initial_profile(user_interests)
print(f"initial_profiles : {initial_profiles}")

# 통합 함수 실행
integrated_df = integrate_dataframes(user_memos, book_metadata, initial_profiles)
print(f"integrated_df111111  : {integrated_df}")
# [2. 텍스트 전처리 ]
import re
import pandas as pd
from konlpy.tag import Okt
from nltk.corpus import stopwords
import nltk

# NLTK 데이터 다운로드 (첫 실행시 한 번만 필요)
nltk.download('stopwords')


# 텍스트 정제 함수
def preprocess_text(text):
    # 대문자를 소문자로 변환 (영어의 경우)
    text = text.lower()

    # 특수 문자 제거 (단, 영문, 한글, 숫자, 공백은 유지)
    text = re.sub(r'[^가-힣a-z0-9\s]', '', text)

    # 불용어 제거 (한국어 불용어 리스트는 별도로 정의해야 함)
    stop_words = set(['은', '는', '이', '가', '을', '를', '의', '에', '에서', '로', '으로'])
    words = text.split()
    text = ' '.join([word for word in words if word not in stop_words])

    # 형태소 분석 및 품사 태깅
    tagged = okt.pos(text)

    # 명사, 형용사, 동사, 영어 단어 선택
    text = ' '.join([word for word, pos in tagged if pos in ['Noun', 'Adjective', 'Verb', 'Alpha']])

    return text

# Okt 형태소 분석기 초기화
okt = Okt()

# 토큰화 함수
def tokenize(text):
    return okt.morphs(text)

# 데이터 전처리 및 토큰화
integrated_df['cleaned_memo'] = integrated_df['memoContent'].apply(preprocess_text)
integrated_df['tokenized_memo'] = integrated_df['cleaned_memo'].apply(tokenize)

print(f"integrated_df : {integrated_df}")

# [3. 감정분석 모델 로드 ]
from tensorflow import keras

model1 = keras.models.load_model('감정분석모델_원본.keras')

# [4. 감정분석 모델 사용해서 분석]
from tensorflow import keras
import numpy as np
from tensorflow.keras.preprocessing.sequence import pad_sequences


def analyze_sentiment(tokenized_text):
    # 수정: tokenized_text가 이미 리스트 형태로 입력되므로 추가 처리 불필요
    if not tokenized_text:
        return 0.5  # 중립 값 반환

    # 1. 단어를 고유 정수로 매핑
    word_index = {word: i + 1 for i, word in enumerate(set(tokenized_text))}

    tokenized_int_text = [word_index.get(word, 0) for word in tokenized_text]

    # 2. 토큰화된 텍스트를 시퀀스로 일정 길이(25)로 패딩
    padded_text = pad_sequences([tokenized_int_text], maxlen=25, padding='post')

    # 3. 준비된 데이터를 모델에 입력하여 예측을 수행
    prediction = model1.predict(padded_text)

    return prediction[0][0]  # 결과값은 0~1 사이의 실수 / 1에 가까울수록 긍정, 0에 가까울수록 부정


# 실행 함수
def perform_sentiment_analysis_by_user_and_shelf(df):
    # 수정: tokenized_memo 컬럼과 tokenized_bookTitle 컬럼을 사용하여 감정 분석 수행
    df['sentiment'] = df['tokenized_memo'].apply(analyze_sentiment)

    # 각 메모의 긍정/부정 레이블 생성
    df['memo_sentiment_label'] = df['sentiment'].apply(lambda x: '긍정' if x >= 0.5 else '부정')

    # userNum, bookNum, shelfNum별로 평균 감정 계산
    avg_sentiment = df.groupby(['userNum', 'bookNum', 'shelfNum'])['sentiment'].mean().reset_index()
    avg_sentiment.columns = ['userNum', 'bookNum', 'shelfNum', 'avg_sentiment']

    # 평균 감정에 대한 레이블 생성
    avg_sentiment['avg_sentiment_label'] = avg_sentiment['avg_sentiment'].apply(lambda x: '긍정' if x >= 0.5 else '부정')

    # 원래의 데이터프레임에 평균 감정 병합
    result = pd.merge(df, avg_sentiment, on=['userNum', 'bookNum', 'shelfNum'])

    # 결과 정리
    # 수정: tokenized_memo 및 tokenized_bookTitle 컬럼 추가
    result = result[['userNum', 'shelfNum', 'bookNum', 'memoNum', 'memoContent', 'tokenized_memo', 'sentiment',
                     'memo_sentiment_label',
                     'avg_sentiment', 'avg_sentiment_label', 'bookTitle', 'writer', 'cateNum', '1depth', '2depth',
                     '3depth', 'rating']]

    return result

# 감정 분석 수행
sentiment_results = perform_sentiment_analysis_by_user_and_shelf(integrated_df)

# [4. 사용자 프로필 생성 ]
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.decomposition import NMF

# 4.1 각 사용자별 긍정/부정 메모 분류
user_sentiment_group = sentiment_results.groupby('userNum')

# 4.2 긍정적 반응을 보인 도서의 특징 추출 (카테고리, 저자, 제목 등)
positive_memo_df = sentiment_results[sentiment_results['sentiment'] >= 0.5]

# 4.2 부정적 반응을 보인 도서의 특징 추출 (카테고리, 저자, 제목 등)
negative_memo_df = sentiment_results[sentiment_results['sentiment'] < 0.5]


def extract_features(df):
    # 사용자별로 추출된 특성 정보 저장한 리스트 features
    features = []
    # 'userNum'별로 데이터 그룹화
    # 그룹화된 각 그룹에서 사용자와 해당 그룹 반환
    for user, group in df.groupby('userNum'):
        # 각 책에 대한 평균 감정 점수 계산
        book_sentiments = group.groupby('bookNum')['sentiment'].mean()

        # 책을 긍정, 중립, 부정으로 분류
        positive_books = book_sentiments[book_sentiments >= 0.6].index.tolist()
        neutral_books = book_sentiments[(book_sentiments < 0.6) & (book_sentiments > 0.4)].index.tolist()
        negative_books = book_sentiments[book_sentiments <= 0.4].index.tolist()

        user_profile = {
            'userNum': user,
            'positive_books': positive_books,
            'neutral_books': neutral_books,
            'negative_books': negative_books,
            'positive_titles': list(set(group[group['bookNum'].isin(positive_books)]['bookTitle'].tolist())),
            'negative_titles': list(set(group[group['bookNum'].isin(negative_books)]['bookTitle'].tolist())),
            'positive_writers': list(set(group[group['bookNum'].isin(positive_books)]['writer'].tolist())),
            'negative_writers': list(set(group[group['bookNum'].isin(negative_books)]['writer'].tolist())),
            'positive_cateNum': list(set(group[group['bookNum'].isin(positive_books)]['cateNum'].tolist())),
            'negative_cateNum': list(set(group[group['bookNum'].isin(negative_books)]['cateNum'].tolist())),
            'positive_1depth': list(set(group[group['bookNum'].isin(positive_books)]['1depth'].tolist())),
            'negative_1depth': list(set(group[group['bookNum'].isin(negative_books)]['1depth'].tolist())),
            'positive_2depth': list(set(group[group['bookNum'].isin(positive_books)]['2depth'].tolist())),
            'negative_2depth': list(set(group[group['bookNum'].isin(negative_books)]['2depth'].tolist())),
            'positive_3depth': list(set(group[group['bookNum'].isin(positive_books)]['3depth'].tolist())),
            'negative_3depth': list(set(group[group['bookNum'].isin(negative_books)]['3depth'].tolist())),
            'positive_memo_count': len(group[group['sentiment'] >= 0.5]),
            'negative_memo_count': len(group[group['sentiment'] < 0.5]),
            'book_sentiment_scores': book_sentiments.to_dict()
        }
        # 생성한 사용자 프로필을 리스트에 추가
        features.append(user_profile)
    # 리스트에 저장된 사용자 프로필 정보를 데이터프레임으로 변환 후 반환
    return pd.DataFrame(features)

# 4.3 사용자별 도서의 특징을 기반으로 사용자 프로필 생성
user_profiles = extract_features(sentiment_results)
# sentiment_results는 모든 메모(긍정/부정)를 포함하는 데이터프레임

# 사용자 프로필 요약 복사
user_profiles_summary = user_profiles.copy()

# 사용자 선호도 결합
from collections import Counter

# 컬럼의 빈도 기반 상위 아이템 계산 함수
def get_top_items(items, n=3):
    # 항목의 빈도를 계산
    item_counts = Counter(items)
    # 빈도순으로 정렬하여 상위 n개 선택
    return [item for item, _ in item_counts.most_common(n)]

# 상위 카테고리 선정 ( 긍정 / 부정 )
user_profiles_summary['top_positive_categories'] = user_profiles_summary['positive_cateNum'].apply(get_top_items)
user_profiles_summary['top_negative_categories'] = user_profiles_summary['negative_cateNum'].apply(get_top_items)

# 상위 작가 선정 ( 긍정 / 부정 )
user_profiles_summary['top_positive_writers'] = user_profiles_summary['positive_writers'].apply(get_top_items)
user_profiles_summary['top_negative_writers'] = user_profiles_summary['negative_writers'].apply(get_top_items)

# 추가적으로 1depth, 2depth, 3depth에 대해서도 같은 방식 적용 ( 긍정 / 부정 )
user_profiles_summary['top_positive_1depth'] = user_profiles_summary['positive_1depth'].apply(get_top_items)
user_profiles_summary['top_negative_1depth'] = user_profiles_summary['negative_1depth'].apply(get_top_items)
user_profiles_summary['top_positive_2depth'] = user_profiles_summary['positive_2depth'].apply(get_top_items)
user_profiles_summary['top_negative_2depth'] = user_profiles_summary['negative_2depth'].apply(get_top_items)
user_profiles_summary['top_positive_3depth'] = user_profiles_summary['positive_3depth'].apply(get_top_items)
user_profiles_summary['top_negative_3depth'] = user_profiles_summary['negative_3depth'].apply(get_top_items)

# 긍정적 메모 비율 계산
user_profiles_summary['positive_ratio'] = user_profiles_summary['positive_memo_count'] / (user_profiles_summary['positive_memo_count'] + user_profiles_summary['negative_memo_count'])

# [5. 데이터 융합]
def create_interaction_matrix(df, user_col, item_col, rating_col):
    # userNum과 bookNum 별로 rating의 평균을 계산
    # unstack 사용해 데이터를 2차원 테이블 형태로 변환
    # fillna(0)로 누락된 값 (NAN)을 0으로 채움
    interactions = df.groupby([user_col, item_col])[rating_col].mean().unstack()
    return interactions.fillna(0)

ratings = sentiment_results[['userNum', 'bookNum', 'sentiment']]

user_book_matrix = create_interaction_matrix(ratings, 'userNum', 'bookNum', 'sentiment')


def preprocess_data(user_profiles, sentiment_results, integrated_df, book_data):
    # 문자열로 저장된 리스트를 실제 파이썬 리스트로 변환하는 함수
    def parse_list(s):
        if isinstance(s, list):
            return s
        try:
            return ast.literal_eval(s)
        except:
            return []

    rows = []
    # user_profiles의 각 행을 순회
    for _, row in user_profiles.iterrows():
        user_num = row['userNum']

        # positive_books 처리
        for book in parse_list(row['positive_books']):
            rows.append({
                'userNum': user_num,
                'bookNum': book,
                'sentiment': 'positive'
            })

        # neutral_books 처리
        for book in parse_list(row['neutral_books']):
            rows.append({
                'userNum': user_num,
                'bookNum': book,
                'sentiment': 'neutral'
            })

        # negative_books 처리
        for book in parse_list(row['negative_books']):
            rows.append({
                'userNum': user_num,
                'bookNum': book,
                'sentiment': 'negative'
            })

    # 처리된 데이터를 DataFrame으로 변환
    user_book_info = pd.DataFrame(rows)

    # sentiment_results에서 평점 정보 추출 및 중복 제거
    ratings = sentiment_results[['userNum', 'bookNum', 'rating']].drop_duplicates()

    # user_book_info에 평점 정보 병합
    user_book_info = user_book_info.merge(ratings, on=['userNum', 'bookNum'], how='left')

    # integrated_df에서 관심사 정보 추출 및 중복 제거
    interests = integrated_df[['userNum', 'interests']].drop_duplicates()

    # user_book_info에 관심사 정보 병합
    user_book_info = user_book_info.merge(interests, on='userNum', how='left')

    # book_data에서 필요한 책 정보 추출 및 중복 제거
    book_info = book_data[['bookNum', 'cateNum', '1depth', '2depth', '3depth']].drop_duplicates()

    # user_book_info에 책 정보 병합
    user_book_info = user_book_info.merge(book_info, on='bookNum', how='left')

    return user_book_info

user_book_info = preprocess_data(user_profiles_summary, sentiment_results, integrated_df, book_metadata)
print(f"user_book_info : {user_book_info}")
import pandas as pd
import numpy as np
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

interest_keywords = {
    '운동': ['운동', '건강'],
    '건강': ['운동', '건강'],
    '음악': ['음악'],
    '영화': ['영화'],
    'tv': ['영화', 'TV', 'OTT'],
    'ott': ['영화', 'TV', 'OTT'],
    '게임': ['게임', '만화'],
    '자기계발': ['자기계발'],
    '여행': ['여행'],
    '패션': ['패션'],
    '요리': ['요리']
}

# [6. 코사인 유사도 모델 실행 ]
def get_books_by_interests(interests, book_data):
    # 여러 관심사에 대한 키워드 가져오기
    all_keywords = []
    for interest in interests:
        keywords = interest_keywords.get(interest.strip().lower(), [interest])
        all_keywords.extend(keywords)

    # 책 데이터에서 키워드가 포함된 책 필터링
    mask = book_data['1depth'].str.contains('|'.join(all_keywords), case=False, na=False) | \
           book_data['2depth'].str.contains('|'.join(all_keywords), case=False, na=False) | \
           book_data['3depth'].str.contains('|'.join(all_keywords), case=False, na=False)

    # 필터링된 책 데이터 반환
    return book_data[mask]


def create_user_vector(user_info, book_data):
    # 사용자 정보를 문자열로 결합
    user_text = ' '.join(user_info['interests'].dropna()) + ' ' + \
                ' '.join(user_info['1depth'].dropna()) + ' ' + \
                ' '.join(user_info['2depth'].dropna()) + ' ' + \
                ' '.join(user_info['3depth'].dropna())

    # TF-IDF 벡터라이저 생성 및 적용
    tfidf = TfidfVectorizer()
    book_vectors = tfidf.fit_transform(book_data['1depth'] + ' ' + book_data['2depth'] + ' ' + book_data['3depth'])
    user_vector = tfidf.transform([user_text])

    return user_vector, book_vectors


def calculate_interest_similarity(user_interests, book_data):
    # 사용자의 모든 관심사에 대한 유사도 점수를 저장할 배열 초기화
    similarities = np.zeros(len(book_data))

    # 각 관심사별로 유사도 계산
    for interest in user_interests.split(','):
        interest = interest.strip().lower()
        interest_books = get_books_by_interest(interest, book_data)

        if not interest_books.empty:
            # 관심사와 관련된 책에 높은 가중치 부여
            similarities[interest_books.index] += 1

    # 정규화: 최대값으로 나누어 0~1 사이의 값으로 변환
    max_similarity = similarities.max()
    if max_similarity > 0:
        similarities = similarities / max_similarity

    return similarities


def get_recommendations(user_info, books, n_recommendations):
    # 사용자 벡터와 책 벡터 생성
    user_vector, book_vectors = create_user_vector(user_info, books)

    # 코사인 유사도 계산
    cosine_similarities = cosine_similarity(user_vector, book_vectors).flatten()

    # 유사도에 따라 책 정렬
    sim_scores = list(enumerate(cosine_similarities))
    sim_scores = sorted(sim_scores, key=lambda x: x[1], reverse=True)

    recommended_books = []
    for i, score in sim_scores:
        if len(recommended_books) >= n_recommendations:
            break

        current_book = books.iloc[i]
        recommended_books.append({
            'bookNum': current_book['bookNum'],
            'bookTitle': current_book['bookTitle'],
            'cateNum': current_book['cateNum'],
            '1depth': current_book['1depth'],
            '2depth': current_book['2depth'],
            '3depth': current_book['3depth'],
            'similarity_score': score
        })

    return recommended_books


def get_rating_sentiment_recommendations(user_info, book_data, n_recommendations):
    # 사용자의 평점 및 감정 정보 추출 (명시적으로 복사본 생성)
    user_ratings = user_info[['bookNum', 'rating', 'sentiment']].copy()

    # 평점과 감정을 결합한 점수 계산
    user_ratings.loc[:, 'combined_score'] = user_ratings.apply(lambda row:
                                                               row['rating'] * (
                                                                   2 if row['sentiment'] == 'positive' else 1 if row[
                                                                                                                     'sentiment'] == 'neutral' else 0.5),
                                                               axis=1
                                                               )

    # 사용자가 이미 평가한 책 제외
    candidate_books = book_data[~book_data['bookNum'].isin(user_ratings['bookNum'])]

    # 각 책의 평균 평점 계산
    book_avg_ratings = user_ratings.groupby('bookNum')['combined_score'].mean().reset_index()

    # 후보 책들과 평균 평점 결합
    candidate_books = candidate_books.merge(book_avg_ratings, on='bookNum', how='left')
    candidate_books['combined_score'] = candidate_books['combined_score'].fillna(0)

    # 점수에 따라 정렬하고 상위 n개 선택
    recommended_books = candidate_books.sort_values('combined_score', ascending=False).head(n_recommendations)

    # 결과 포맷팅
    recommendations = []
    for _, book in recommended_books.iterrows():
        recommendations.append({
            'bookNum': book['bookNum'],
            'bookTitle': book['bookTitle'],
            'cateNum': book['cateNum'],
            '1depth': book['1depth'],
            '2depth': book['2depth'],
            '3depth': book['3depth'],
            'similarity_score': book['combined_score']
        })

    return recommendations


def recommend_books_for_user(user_book_info, book_data, user_id, n_recommendations=5):
    user_info = user_book_info[user_book_info['userNum'] == user_id]

    if user_info.empty:
        print(f"No user information found for user {user_id}")
        return pd.DataFrame()

    user_interests = user_info['interests'].iloc[0].split(',')
    print(f"User {user_id} interests: {user_interests}")

    # 관심사 기반 책 필터링
    interest_books = get_books_by_interests(user_interests, book_data)

    # cateNum이 없는 경우 확인 (새로운 사용자 또는 책을 읽지 않은 사용자)
    if user_info['cateNum'].isnull().all():
        print(f">>>>>>> New user or user without book ratings: {user_id}")
        interests_weight, sentiment_weight, rating_weight = 1.0, 0.0, 0.0
        weight_case = "Case 0: 관심사만 고려 (새 사용자)"
    else:
        # 기존 로직
        user_info_count = len(user_info)
        neutral_count = len(user_info[user_info['sentiment'] == 'neutral'])

        if user_info_count < 3:
            interests_weight, sentiment_weight, rating_weight = 0.7, 0.1, 0.2
            weight_case = "Case 1: 관심사 > 평점 > 감정"
        elif neutral_count / user_info_count > 0.5:
            interests_weight, sentiment_weight, rating_weight = 0.4, 0.2, 0.4
            weight_case = "Case 2: 평점 > 관심사 = 감정"
        else:
            interests_weight, sentiment_weight, rating_weight = 0.2, 0.3, 0.5
            weight_case = "Case 3: 평점 > 감정 > 관심사"

    # 관심사 기반 추천
    interest_recommendations = get_recommendations(user_info, interest_books, n_recommendations)
    for book in interest_recommendations:
        book['recommendation_type'] = '관심사 기반'

    final_recommendations = []

    if interests_weight == 1.0:
        # 새 사용자 또는 책을 읽지 않은 사용자: 관심사만 고려
        final_recommendations = interest_recommendations[:n_recommendations]
    else:
        # 평점 및 감정 기반 추천
        rating_sentiment_recommendations = get_rating_sentiment_recommendations(user_info, book_data, n_recommendations)
        for book in rating_sentiment_recommendations:
            book['recommendation_type'] = '평점/감정 기반'

        # 가중치에 따른 최종 추천 생성
        interest_count = int(n_recommendations * interests_weight)
        rating_sentiment_count = n_recommendations - interest_count

        final_recommendations.extend(interest_recommendations[:interest_count])
        final_recommendations.extend(rating_sentiment_recommendations[:rating_sentiment_count])

    # 추천 책 정보에 가중치 정보 추가
    for book in final_recommendations:
        book.update({
            'interests_weight': interests_weight,
            'sentiment_weight': sentiment_weight,
            'rating_weight': rating_weight,
            'weight_case': weight_case
        })

    return pd.DataFrame(final_recommendations)


def recommend_books_for_all_users(user_book_info, book_data):
    # 모든 사용자의 추천 결과를 저장할 딕셔너리
    all_recommendations = {}

    # 각 사용자에 대해 추천 생성
    for user_id in user_book_info['userNum'].unique():
        recommendations = recommend_books_for_user(user_book_info, book_data, user_id)
        all_recommendations[user_id] = recommendations

    # 전체 추천 결과 반환
    return all_recommendations

# 전체 사용자에 대한 추천 생성
all_recommendations = recommend_books_for_all_users(user_book_info, book_metadata)

# 결과 출력
for user_id, recommendations in all_recommendations.items():
    user_interests = user_book_info[user_book_info['userNum'] == user_id]['interests'].iloc[0]
    print(f"Recommendations for user {user_id}:")
    print(f"User Interests: {user_interests}")
    if not recommendations.empty:
        print(recommendations[['bookTitle', 'cateNum', '1depth', '2depth', '3depth', 'similarity_score', 'interests_weight', 'sentiment_weight', 'rating_weight', 'weight_case', 'recommendation_type']])
    else:
        print("No recommendations found for this user.")
    print("\n")

# [7. spring boot와 연동]
import pandas as pd
import numpy as np
from flask import jsonify
from flask import Flask, jsonify
def convert_int64_to_int(data):
    """
    Convert int64, float64, and other numpy types to Python native types in dictionaries or lists.
    """
    if isinstance(data, dict):
        return {convert_int64_to_int(k): convert_int64_to_int(v) for k, v in data.items()}
    elif isinstance(data, list):
        return [convert_int64_to_int(item) for item in data]
    elif isinstance(data, np.integer):
        return int(data)
    elif isinstance(data, np.floating):
        return float(data)
    elif isinstance(data, np.ndarray):
        return data.tolist()
    elif isinstance(data, pd.Series):
        return convert_int64_to_int(data.to_dict())
    elif isinstance(data, pd.DataFrame):
        return convert_int64_to_int(data.to_dict('records'))
    return data

app = Flask(__name__)

@app.route('/recommendations', methods=['GET'])
def get_all_recommendations():
    app.logger.info("Received request for recommendations")
    try:
        # 데이터베이스 연결을 매 요청마다 새로 생성
        engine = create_engine(
            f"mysql+mysqlconnector://{db_config['user']}:{db_config['password']}@{db_config['host']}/{db_config['database']}")

        # 필요한 데이터를 데이터베이스에서 새로 수집
        user_memos = collect_user_memos()
        book_metadata = collect_book_metadata_with_category()
        user_interests = collect_user_interests()

        # 초기 프로필 새로 생성
        initial_profiles = create_initial_profile(user_interests)

        # 데이터 통합 과정을 새로 수행
        integrated_df = integrate_dataframes(user_memos, book_metadata, initial_profiles)

        # 'memoContent' 컬럼이 없는 행에 대해 빈 문자열로 채움
        integrated_df['memoContent'] = integrated_df['memoContent'].fillna('')

        # 텍스트 전처리 및 토큰화 수행
        integrated_df['cleaned_memo'] = integrated_df['memoContent'].apply(preprocess_text)
        integrated_df['tokenized_memo'] = integrated_df['cleaned_memo'].apply(tokenize)

        # 감정 분석을 새로 수행
        sentiment_results = perform_sentiment_analysis_by_user_and_shelf(integrated_df)

        # 사용자 프로필 생성
        user_profiles = extract_features(sentiment_results)
        user_profiles_summary = user_profiles.copy()

        # user_book_info를 새로 생성
        user_book_info = preprocess_data(user_profiles_summary, sentiment_results, integrated_df, book_metadata)

        all_recommendations = recommend_books_for_all_users(user_book_info, book_metadata)

        final_recommendations = {}
        for user_id, recommendations in all_recommendations.items():
            user_interests = user_book_info[user_book_info['userNum'] == user_id]['interests'].iloc[0]
            print(f"User {user_id} interests: {user_interests}")

            if not recommendations.empty:
                user_recommendations = recommendations[['bookTitle', 'bookNum', 'cateNum', '1depth', '2depth', '3depth',
                                                        'similarity_score', 'interests_weight', 'sentiment_weight',
                                                        'rating_weight', 'weight_case', 'recommendation_type']]
                recommendations_list = convert_int64_to_int(user_recommendations)
                final_recommendations[int(user_id)] = {
                    "interests": user_interests,
                    "recommendations": recommendations_list
                }
            else:
                final_recommendations[int(user_id)] = {
                    "interests": user_interests,
                    "recommendations": []
                }

        final_recommendations = convert_int64_to_int(final_recommendations)

        app.logger.info(f"Returning recommendations for {len(final_recommendations)} users")
        return jsonify(final_recommendations)
    except Exception as e:
        app.logger.error(f"Error occurred: {str(e)}")
        return jsonify({"error": str(e)}), 500

import logging
logging.basicConfig(level=logging.DEBUG)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5010, debug=True)