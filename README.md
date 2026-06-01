# Fullstack Take-Home Assessment: Conversion Journey Dashboard

## Overview

Build a minimal **Conversion Journey Dashboard** — a fullstack app that visualizes how users interact with advertising campaigns across multiple channels before converting.

You are given a mock dataset (seed SQL) and a design reference (HTML mockup). Build a Spring Boot backend to serve the data and a React frontend to display it.

**Deadline: End of day Monday.**
Focus on clean, working code. If you run out of time, note what's remaining in your README.

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| **Backend** | Java 17, Spring Boot 3.x, Spring Data JPA, PostgreSQL, Flyway, Maven, Lombok |
| **Frontend** | React 18+, TypeScript, Tailwind CSS (or CSS of your choice) |

---

## What You're Building

An advertising platform tracks conversions (purchases, leads, page visits) and the ad impressions that preceded them. Each conversion has a **journey** — a sequence of ad touchpoints across channels (Google, Meta, Programmatic, Direct) that the user saw before converting.

Your dashboard shows:
1. **KPI summary cards** — total conversions, avg touchpoints, avg time to convert, multi-touch rate
2. **Top conversion paths** — the most common channel sequences leading to conversion
3. **Conversion details table** — paginated list of individual conversions with their journey paths, filterable by conversion type

---

## Design Reference

Open `mockup/conversion-journey-mockup.html` in a browser — this is your visual target. You don't need to match it pixel-for-pixel, but aim for the same layout and information hierarchy.

**Required sections:**
- KPI row (4 cards)
- Top Conversion Paths (ranked list with path pills and progress bars)
- Conversion Details table with type filter tabs and pagination

**You can skip:**
- The donut chart (First Touch Attribution)
- The filter bar dropdowns (date range, campaign, window) — hardcode these
- Export CSV functionality

---

## Data Model

### Conversion
| Field | Type | Description |
|-------|------|-------------|
| id | UUID | Primary key |
| advertiser_id | String | The advertiser this conversion belongs to |
| conversion_date | Timestamp | When the conversion happened |
| type | Enum | `CHECKOUT`, `LEAD`, `PAGE_VISIT` |
| subcategory | String | Freeform label (e.g. "purchase", "contactus", "homepage") |
| revenue | Decimal (nullable) | Revenue amount (only for CHECKOUT type) |

### Touchpoint
| Field | Type | Description |
|-------|------|-------------|
| id | UUID | Primary key |
| conversion_id | UUID (FK) | References Conversion |
| channel | Enum | `GOOGLE`, `META`, `PROGRAMMATIC`, `DIRECT` |
| channel_detail | String | Specific tactic (e.g. "Google Search", "Meta Retarget") |
| impression_date | Timestamp | When the ad was seen |
| sequence_index | Integer | Order in the journey (1 = first touch) |

A conversion has 1–N touchpoints, ordered by `sequence_index`.

---

## Backend Requirements

### Database Setup
- Use Flyway for schema migration
- Use the provided `seed-data.sql` to populate test data (copy it into your migrations folder)

### REST API

**`GET /api/v1/conversions/summary?advertiserId={id}`**

Returns:
```json
{
  "totalConversions": 50,
  "avgTouchpoints": 2.8,
  "avgTimeToConvertDays": 5.1,
  "multiTouchRate": 72.0
}
```
- `avgTouchpoints` = average touchpoint count per conversion
- `avgTimeToConvertDays` = average days between first touchpoint and conversion date
- `multiTouchRate` = % of conversions with 2+ touchpoints

**`GET /api/v1/conversions/top-paths?advertiserId={id}&limit=5`**

Returns the most common channel sequences:
```json
[
  {
    "rank": 1,
    "path": ["GOOGLE", "META", "DIRECT"],
    "conversions": 12,
    "percentage": 100.0
  },
  {
    "rank": 2,
    "path": ["PROGRAMMATIC", "GOOGLE"],
    "conversions": 8,
    "percentage": 66.7
  }
]
```
- Group conversions by their ordered channel sequence
- `percentage` is relative to the #1 path (for progress bar width)

**`GET /api/v1/conversions?advertiserId={id}&type={type}&page=0&size=6`**

Returns paginated conversion details:
```json
{
  "content": [
    {
      "id": "...",
      "conversionDate": "2026-05-20T14:30:00",
      "type": "CHECKOUT",
      "touchpoints": [
        { "channel": "GOOGLE", "channelDetail": "Google Search", "sequenceIndex": 1 },
        { "channel": "META", "channelDetail": "Meta Retarget", "sequenceIndex": 2 },
        { "channel": "DIRECT", "channelDetail": "Direct", "sequenceIndex": 3 }
      ],
      "touchpointCount": 3,
      "timeToConvertDays": 6,
      "revenue": 2450.00
    }
  ],
  "totalElements": 50,
  "totalPages": 9,
  "number": 0,
  "size": 6
}
```
- `type` filter is optional — when omitted, return all
- Ordered by `conversionDate` desc

### Patterns
- Java records for DTOs
- `@RequiredArgsConstructor` for injection (no `@Autowired`)
- `@Slf4j` for logging
- `@Builder` on entities
- `@CreatedDate`/`@LastModifiedDate` for audit fields
- Controller → Service → Repository separation
- Custom exception + `@ControllerAdvice` for error responses

---

## Frontend Requirements

### Single Page, Three Sections

**1. KPI Cards Row**
- 4 cards: Total Conversions, Avg Touchpoints, Avg Time to Convert, Multi-Touch Rate
- Fetch from `/api/v1/conversions/summary`

**2. Top Conversion Paths**
- Ranked list with colored channel pills and arrows between them
- Progress bar showing relative volume
- Fetch from `/api/v1/conversions/top-paths`

**3. Conversion Details Table**
- Columns: Date, Type, Journey Path (channel pills), Touchpoints, Time to Convert, Revenue
- **Filter tabs**: "All", "Checkouts", "Leads", "Page Visits" — re-fetches with `type` param
- **Pagination** at the bottom
- Fetch from `/api/v1/conversions`

### Channel Colors
| Channel | Color |
|---------|-------|
| Google | `#6D49D4` (purple) |
| Meta | `#44BDB6` (teal) |
| Programmatic | `#FF5522` (orange) |
| Direct | `#8c8e92` (gray) |

### What We Care About
- Clean component structure
- TypeScript types for API responses
- Loading and error states
- Readable, not over-engineered

### What You Can Skip
- Authentication
- State management libraries (useState is fine)
- Fancy animations
- Mobile design

---

## Deliverables

1. GitHub repo with backend and frontend
2. Your own `README.md` with:
   - How to run it (docker-compose for Postgres + backend/frontend commands)
   - Design decisions and tradeoffs
   - What you'd improve with more time
3. `mvn clean test` passes
4. Frontend runs with `npm run dev`

---

## Evaluation Criteria

| Area | What we're looking for |
|------|----------------------|
| **Data modeling** | Correct JPA relationships, Flyway migrations, efficient queries (especially top-paths aggregation) |
| **API design** | Clean REST conventions, DTOs, pagination, filtering, error handling |
| **Frontend structure** | Component decomposition, TypeScript types, data fetching, loading/error states |
| **UI quality** | Follows the mockup layout, channel colors, path pills, readable table |
| **Testing** | At least one service unit test and one controller integration test |
| **Code quality** | Consistent style, no dead code, sensible naming, clean commits |

---

## Tips

- Start with the backend: schema → seed → endpoints. Verify with curl.
- The top-paths query is the most interesting part — think about how to group by ordered channel sequence.
- Frontend: get data rendering first, then polish styling.
- Don't over-engineer. Clean simple code beats elaborate architecture.
