import React, { useEffect, useRef, useState } from 'react';
import styles from './Chat.module.css';

const Chat = () => {
  const mapRef = useRef(null);
  const [currentLocation, setCurrentLocation] = useState(null);
  const [map, setMap] = useState(null);
  const [marker, setMarker] = useState(null);

  useEffect(() => {
    const script = document.createElement('script');
    script.src = "https://apis.openapi.sk.com/tmap/vectorjs?version=1&appKey=pxJVuJVBeF91MbeefN9aU7l9QJtVfvUK7MSc3kdV";
    script.async = true;
    document.head.appendChild(script);

    script.onload = () => {
      initTmap();
    };

    return () => {
      document.head.removeChild(script);
    };
  }, []);

  const initTmap = () => {
    if (window.Tmapv3 && mapRef.current) {
      const newMap = new window.Tmapv3.Map(mapRef.current, {
        center: new window.Tmapv3.LatLng(37.56520450, 126.98702028), // 초기 중심 좌표 (서울)
        width: "100%",
        height: "100%",
        zoom: 16
      });
      setMap(newMap);
    }
  };

  const getCurrentLocation = () => {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const newLocation = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };
          setCurrentLocation(newLocation);
          updateMapCenter(newLocation.lat, newLocation.lng);
        },
        (error) => {
          console.error("Error getting location:", error);
          alert("위치 정보를 가져오는데 실패했습니다. 권한을 확인해주세요.");
        },
        { enableHighAccuracy: true, timeout: 5000, maximumAge: 0 }
      );
    } else {
      console.error("Geolocation is not supported by this browser.");
      alert("이 브라우저에서는 위치 정보를 지원하지 않습니다.");
    }
  };

  const updateMapCenter = (lat, lng) => {
    if (map) {
      const newCenter = new window.Tmapv3.LatLng(lat, lng);
      map.setCenter(newCenter);
      
      // 기존 마커가 있으면 제거
      if (marker) {
        marker.setMap(null);
      }

      // 새 위치에 마커 추가
      const newMarker = new window.Tmapv3.Marker({
        position: newCenter,
        map: map,
        icon: "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
        iconSize: new window.Tmapv3.Size(24, 38),
        title: "현재 위치"
      });
      setMarker(newMarker);
    }
  };

  return (
    <div className={styles.mapContainer}>
      <div className={styles.dataCard33}>
        <div id="map_div" ref={mapRef} className={styles.mapDiv}></div>
      </div>
      <button onClick={getCurrentLocation} className={styles.locationButton}>
        현재 위치 가져오기
      </button>
    </div>
  );
};

export default Chat;