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

For dev you can use:

    $ cd demo && ./mvnw package && ./mvnw spring-boot:run

We can hit the API like so:
    curl -i 'http://localhost:9090/api/v1/conversions/summary?advertiserId=adv-demo-001'



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
