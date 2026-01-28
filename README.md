# Event-Driven Board System

Kafka 기반 이벤트 드리븐 아키텍처를 적용해  
서비스 간 결합도를 낮추고 확장성을 고려한  
MSA 백엔드 포트폴리오 프로젝트입니다.

게시글 작성 이후의 후속 처리를 비동기 이벤트로 분리해  
응답 흐름과 운영 안정성을 함께 고려했습니다.

## Architecture Overview

[ Client ]
      ↓
[ Gateway ]
      ↓
[ Board Service ] ──▶ (Kafka Event) ──▶ [ Activity Service ]

## Why Event-Driven

기능 확장 시 서비스 간 동기 의존이 증가하는 문제를 피하기 위해  
상태 변화는 이벤트로 전달하도록 설계했습니다.  
이를 통해 장애 전파를 줄이고, 서비스 확장에 유연한 구조를 목표로 했습니다.

## Infrastructure

- Docker 기반 실행 환경
- AWS EC2 / RDS 기준 설계
- 향후 오토 스케일링 및 관리형 메시지 서비스 확장 고려

## More Details

설계 배경과 상세 구현 과정은  
Notion 기반 포트폴리오 문서에 정리되어 있으며,  
면접 시 설명 자료로 활용 가능합니다.
