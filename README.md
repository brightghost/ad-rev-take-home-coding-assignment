# Fullstack Take-Home Assessment: Conversion Journey Dashboard

## Deliverables
- [x] GitHub repo with backend and frontend
- [x] Your own README.md with:
- [x] How to run it (docker-compose for Postgres + backend/frontend commands)
- [x] Design decisions and tradeoffs
- [x] What you'd improve with more time
- [x] `mvn clean test` passes
- [x] Frontend runs with `npm run dev`

## HOWTO
To launch the demo app:
Backend:
````
        docker compose up --build -d app
````
Frontend:
````
        cd demo/frontend/src && npm start
````
Web interface will be accessible at http://localhost:3000/

For backend dev you can use:
    $ docker compose up postgres -d
    $ cd demo && ./mvnw clean flyway:migrate && ./mvnw package && ./mvnw spring-boot:run

We can hit the API like so:
    $ curl -i 'http://localhost:9090/api/v1/conversions/summary?advertiserId=adv-demo-001'
    HTTP/1.1 200 
    Content-Type: application/json
    Content-Length: 93
    Date: Fri, 05 Jun 2026 07:11:07 GMT

    {"avgTouchpoints":2.5,"multiTouchRate":86.0,"avgTimeToConvertDays":4.4,"totalConversions":50}
    $ curl -i 'http://localhost:9090/api/v1/conversions/c001'
        HTTP/1.1 200 
        Content-Type: application/json
        Content-Length: 149
        Date: Fri, 05 Jun 2026 07:06:04 GMT

        {"advertiserId":"adv-demo-001","conversion_date":"2026-05-20T19:30:00.000Z","id":"c001","revenue":2450.00,"subcategory":"purchase","type":"CHECKOUT"}

## TODO Backend
- [x] Java records for DTOs
- [ ] @RequiredArgsConstructor for injection (no @Autowired)
- [ ] @Slf4j for logging
- [ ] @Builder on entities
- [ ] @CreatedDate/@LastModifiedDate for audit fields
- [x] Controller → Service → Repository separation
- [x] Custom exception + @ControllerAdvice for error respon

- [ ] file structure should be refactored  `/demo/frontend` -> `/frontend`; `/demo` -> `/backend`
 
- [ ]  sql schema is used as-is from the seed data; should build a flyway
  migration that replaces id strings with UUIDs as defined in the schema
- [ ] layers should be defined for performant image [https://docs.spring.io/spring-boot/reference/packaging/container-images/efficient-images.html]

## TODO Frontend
- [ ] demo is hardcoded for advertiser id 'adv-demo-001'; this should be set per
  the logged-in user when auth logic is implemented
- [ ] stub react components need to be themed, add dummy widgets to match the mockup
- [ ] Set document title
- [ ] Clean component structure
- [ ] TypeScript types for API responses
- [ ] Loading and error states
- [x] Readable, not over-engineered

## BUGS
- [ ] Didn't have much time to conside data modeling/archictecture due to scope
- [ ] Somehow the `ad-rev-take-home-coding-assignment-app` container is stuck
  using port 9090 from an earlier config, even when I switched everything back
  to 8080, rebuilt containers, mvn clean. AI couldn't figure this out either.
  for now just switching it back to 9090.
- [ ] My laptop doesn't have enough ram for all this Java and Node :<
