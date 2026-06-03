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
````
    # front
        cd demo/frontend/src && npm start
    # back
        docker compose up --build -d app
````
Web interface will be accessible at http://localhost:3000/

## TODO Backend
- [x] Java records for DTOs
- [ ] @RequiredArgsConstructor for injection (no @Autowired)
- [ ] @Slf4j for logging
- [ ] @Builder on entities
- [ ] @CreatedDate/@LastModifiedDate for audit fields
- [x] Controller → Service → Repository separation
- [x] Custom exception + @ControllerAdvice for error respon

- [ ] file structure should be refactored `/demo` -> `/backend`
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
- [ ] My laptop doesn't have enough ram for all this Java and Node :<
