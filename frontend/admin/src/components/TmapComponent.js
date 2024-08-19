import React, { useEffect, useState, useRef } from "react";

export default function TmapComponent(props) {
  const { markerPositions, size } = props;
  const [tmapInstance, setTmapInstance] = useState(null);
  const [, setMarkers] = useState([]);
  const container = useRef();

  useEffect(() => {
    const script = document.createElement("script");
    script.src = "https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=pxJVuJVBeF91MbeefN9aU7l9QJtVfvUK7MSc3kdV";
    document.head.appendChild(script);
    script.onload = () => {
      const map = new window.Tmapv2.Map(container.current, {
        center: new window.Tmapv2.LatLng(37.566481622437934, 126.98502302169841),
        width: "100%",
        height: "100%",
        zoom: 15
      });
      setTmapInstance(map);
    };
  }, []);

  useEffect(() => {
    if (tmapInstance === null) {
      return;
    }
    // 뷰포트 크기 변경
    const [width, height] = size;
    container.current.style.width = `${width}px`;
    container.current.style.height = `${height}px`;
    tmapInstance.resize();
  }, [tmapInstance, size]);

  useEffect(() => {
    if (tmapInstance === null) {
      return;
    }
    setMarkers((markers) => {
      // 이전 마커 제거
      markers.forEach((marker) => marker.setMap(null));
      // 새 마커 생성
      return markerPositions.map(
        (pos) => new window.Tmapv2.Marker({
          position: new window.Tmapv2.LatLng(pos[0], pos[1]),
          map: tmapInstance
        })
      );
    });
    if (markerPositions.length > 0) {
      const bounds = new window.Tmapv2.LatLngBounds();
      markerPositions.forEach((pos) => {
        bounds.extend(new window.Tmapv2.LatLng(pos[0], pos[1]));
      });
      tmapInstance.fitBounds(bounds);
    }
  }, [tmapInstance, markerPositions]);

  return <div id="tmap-container" ref={container} />;
}