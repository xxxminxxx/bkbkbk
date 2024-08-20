package com.bookbookbook.service;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.bookbookbook.domain.DocityVO;
import com.bookbookbook.domain.LibraryVO;
import com.bookbookbook.persistence.DoCityRepository;
import com.bookbookbook.persistence.LibraryRepository;

@Service
public class FindLocationServiceImpl implements FindLocationService {

    @Value("${library.api.findbooklocation.url}")
    private String bookSearchUrl;

    @Value("${library.api.findbooklocation.key}")
    private String bookSearchKey;
    
    @Autowired
    private RestTemplate restTemplate;

	  
    @Autowired
    private LibraryRepository libraryRepository;

    @Autowired
    private DoCityRepository doCityRepository;
 
/*
  @Override
    public String findLibrariesByBook(String isbn, String localCode) {
        System.out.println("FindLocationServiceImpl: findLibrariesByBook() 호출됨");

        String apiUrl = bookSearchUrl + "?authKey=" + bookSearchKey + "&isbn=" + isbn + "&region=" + localCode + "&format=json";
        System.out.println("findLibrariesByBook - apiUrl: " + apiUrl);

        RestTemplate restTemplate = new RestTemplate();
        String response = restTemplate.getForObject(apiUrl, String.class);

        System.out.println("findLibrariesByBook - response: " + response);
        return response;
    }
    */

	/*
	 * private final String apiKey; private final String apiUrl;
	 * 
	 * public FindLocationServiceImpl(
	 * 
	 * @Value("${nl.api.key}") String apiKey,
	 * 
	 * @Value("${nl.api.url}") String apiUrl) { this.apiKey = apiKey; this.apiUrl =
	 * apiUrl; }
	 * 
	 * @Override public List<LibraryVO> findLibrariesWithBook(String isbn, Integer
	 * localCode) { UriComponentsBuilder builder =
	 * UriComponentsBuilder.fromHttpUrl(apiUrl) .queryParam("key", apiKey)
	 * .queryParam("systemType", "오프라인자료") .queryParam("isbnOp", "isbn")
	 * .queryParam("isbnCode", isbn) .queryParam("localCode", localCode);
	 * 
	 * String result = restTemplate.getForObject(builder.toUriString(),
	 * String.class);
	 * 
	 * // XML 파싱 및 LibraryVO 객체 리스트 생성 List<LibraryVO> libraries =
	 * parseXmlResult(result);
	 * 
	 * // 도서관 정보를 DB에서 가져와 위도, 경도 정보 추가 return
	 * enrichLibrariesWithLocation(libraries); }
	 * 
	 * private List<LibraryVO> parseXmlResult(String xmlResult) { // XML 파싱 로직 구현 //
	 * 실제 구현은 API 응답 구조에 따라 달라질 수 있음 List<LibraryVO> libraries = new ArrayList<>();
	 * // TODO: XML 파싱 로직 구현 return libraries; }
	 * 
	 * private List<LibraryVO> enrichLibrariesWithLocation(List<LibraryVO>
	 * libraries) { for (LibraryVO library : libraries) { LibraryVO dbLibrary =
	 * libraryRepository.findByLibraryName(library.getLibraryName()); if (dbLibrary
	 * != null) { library.setLatitude(dbLibrary.getLatitude());
	 * library.setLongitude(dbLibrary.getLongitude()); } } return libraries; }
	 */
  
  /* 사용 X  
    @Override
    public List<LibraryVO> findLibrariesByLocalCode(Integer localCode) {
    	System.out.println("findLibrariesByLocalCode 서비스임플 실행");
    	List<LibraryVO> result = libraryRepository.findByLocalCode(localCode);
    	System.out.println("findLibrariesByLocalCode 서비스임플 실행 결과 : " + result);
    	return result; 
    }
*/
    // [1] 위치찾기 버튼 클릭 시, 시군구 선택 페이지 이동 때 실행
    @Override
    public List<String> findDistinctDoNames() {
    	System.out.println("findDistinctDoNames 서비스임플 실행");
    	List<String> result = doCityRepository.findDistinctDoNames();
    	System.out.println("findDistinctDoNames 서비스임플 실행 결과 : " + result);
        return result;
    }

	/*
	 * public List<DocityVO> findGugunsByDoName(String doName) {
	 * System.out.println("서비스 실행 findGugunsByDoName doname : " + doName);
	 * List<DocityVO> result = doCityRepository.findGugunsByDoName(doName);
	 * System.out.println("서비스 실행 결과 result : " + result); return result; }
	 */
    // [2] 시 선택 시, 구군 불러오기 
    @Override
    public List<DocityVO> findGugunsByDoName(String doName) {
    	System.out.println("findGugunsByDoName 서비스 임플 실행");
        List<Object[]> results = doCityRepository.findGugunsByDoName(doName);
        List<DocityVO> guguns = new ArrayList<>();

        for (Object[] result : results) {
            DocityVO docityVO = new DocityVO();
            docityVO.setLocalCode((Integer) result[0]);
            docityVO.setCity((String) result[1]);
            docityVO.setDoName((String) result[2]);
            docityVO.setLongitude((String) result[3]);
            docityVO.setLatitude((String) result[4]);
            System.out.println("docity 출력 : " + docityVO);
            guguns.add(docityVO);
        }
        
    	System.out.println("findGugunsByDoName 서비스 임플 실행 결과 : " + guguns);

        return guguns;
    }
    
    // [3] LocalCode 통해서 LibraryCode 조회
    public List<Integer> getLibraryCodeByLocalCode(Integer localCode){
    	System.out.println("getLibraryCodeByLocalCode 서비스 실행");
    	List<Integer> result  = libraryRepository.getLibraryCodeByLocalCode(localCode);
    	System.out.println("getLibraryCodeByLocalCode 서비스 결과 : " + result);
    	return result;
    }
    
    // [4] LibraryCode, isbn 통해서 API 실행
    public LibraryVO getLibraryByApi(String isbn, Integer libraryCode) {
        System.out.println("getLibraryByApi 서비스 실행");

        // API 요청 URL 생성
        String url = String.format("%s?authKey=%s&libCode=%d&isbn13=%s",
                bookSearchUrl, bookSearchKey, libraryCode, isbn);

        // API 호출 및 응답 받기
        String response = restTemplate.getForObject(url, String.class);

        // 전체 XML 응답 출력
        System.out.println("Full XML Response for library " + libraryCode + ": " + response);

        try {
            // XML 파싱
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(new InputSource(new StringReader(response)));

            // 'hasBook'과 'loanAvailable' 태그 찾기
            NodeList hasBookList = document.getElementsByTagName("hasBook");
            NodeList loanAvailableList = document.getElementsByTagName("loanAvailable");

            if (hasBookList.getLength() > 0 && loanAvailableList.getLength() > 0) {
                String hasBook = hasBookList.item(0).getTextContent();
                String loanAvailable = loanAvailableList.item(0).getTextContent();
                
                System.out.println("Library " + libraryCode + " - hasBook: " + hasBook + ", loanAvailable: " + loanAvailable);

                if ("Y".equals(hasBook)) {
                    LibraryVO library = libraryRepository.findByLibraryCode(libraryCode);
                    library.setHasBook(hasBook);
                    library.setLoanAvailable(loanAvailable);
                    System.out.println("library : " + library);
                    if (library != null) {
						/*
						 * library.setHasBook(hasBook); library.setLoanAvailable(loanAvailable);
						 */
                        return library;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Error processing library " + libraryCode + ": " + e.getMessage());
            e.printStackTrace();
        }

        return null;
    }

    

/* 사용하지 않고 있음
    @Override
    public List<LibraryVO> findLibrariesByDoName(String doName) {
    	System.out.println("findLibrariesByDoName 서비스 임플 실행");
    	List<LibraryVO> result = libraryRepository.findByDoName(doName);
    	System.out.println("findLibrariesByDoName 서비스 임플 실행 결과 : " + result);
        return result;
    }
*/

}
