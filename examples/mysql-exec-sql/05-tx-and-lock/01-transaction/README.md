# 5. 1 트랜잭션

## 트랜잭션, 락, 격리 수준

- 트랜잭션하고 락은 비슷한 개념이라고 생각할 수 있지만
- 트랜잭션의 핵심은 데이터의 정합성 혹은 작업의 완전성이 핵심이고
    - 즉, 트랜잭션은 100% 완료되던지 0%로 롤백되어야만 한다 → 데이터가 일부분만 업데이트되는 ***Partial Update*** 가 일어나면 안된다 이거야
- 락은 동시성 제어가 핵심이다
    - 즉, 여러 커넥션에 대해 한번에는 하나의 커넥션만 데이터를 변경할 수 있게 하는 것이다
- 트랜잭션 격리 레벨은 이러한 락을 이용해 여러 트랜잭션 간의 작업 내용을 어느정도까지 공유하고 고립시킬지를 나타내는 레벨이다

## MyISAM, MEMORY, InnoDB

- 뭐 지금은 MySQL 의 기본 스토리지 엔진이 InnoDB 이지만
- 옛날에는 MyISAM 이 기본으로 사용되었는데
- 이놈은 트랜잭션을 지원하지 않는다 → MySQL 에서는 InnoDB 만 지원하더라
- 그래서 MySQL 은 트랜잭션기능의 선택권이 있게 되는데
- 귀찮다고 트랜잭션을 사용하지 않는다면 나중에 더 귀찮아진다 → ***Partial Update*** 가 일어나면 쓰레기값이 들어가고 이것을 처리해주는 작업이 필요하기 때문
    - 또한 트랜잭션 없이 ROLLBACK 기능을 구현하려면 중첩 IF 문을 오지게 써야 한다
    - 그냥 트랜잭션 있는 InnoDB 써라 이거야

## 트랜잭션 범위 설정

- DB 의 커넥션도 한정된 자원이므로 커넥션을 갖고 있는 기간이 최소가 되도록 해야하지만
- 트랜잭션 또한 트랜잭션 시작과 종료의 범위를 최소화시켜야 한다
    - 어쨋든 트랜잭션이 시작되면 ACID 의 Isolation 에 의해 다른 트랜잭션들의 처리에 영향을 미치기 때문이다
- 따라서 커넥션과 트랜잭션은 다음과 같이 설정하는 것이 바람직하다
    - DB 에 의존하지 않는 코드는 커넥션에서 빼야 한다 → 아무리 코드가 빨리 실행된다고 하더라도 커넥션은 한정된 자원이므로 불필요하게 갖고 있을 이유가 없다
    - DB 의 단순 조회의 경우에는 트랜잭션에서 제외하는 것이 좋다 → 데이터를 변경하는 것이 아니므로 트랜잭션에 포함될 이유가 없다
    - 성격이 다른 데이터 업데이트는 트랜잭션을 분리하자 → 트랜잭션의 특성상 하나의 작업이 실패하면 전부 롤백되므로 실패 여부와 상관 없는 작업은 트랜잭션을 분리하는 것이 바람직하다
    - 트랜잭션에는 **절대로** 외부와의 통신 작업이 포함되면 안된다 → 만일 외부와의 통신이 불가능해질 경우, 통신의 timeout 을 기다리느라 트랜잭션이 지연되는 등의 위험한 상황이 발생할 수 있다