# Moonphase Tracker - Visual Design Specifications

## 🎨 Hero Section Design Upgrade

### Desktop Layout (> 1000px)
```
┌─────────────────────────────────────────────────────────────┐
│                   🌙 MOONPHASE TRACKER                       │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│   ┌──────────────────┐            ┌──────────────────────┐  │
│   │                  │            │  CURRENT MOON DATA   │  │
│   │   ◐ WAXING       │            │  ═══════════════════ │  │
│   │   CRESCENT       │            │                      │  │
│   │                  │            │  Phase:  🌓 Crescent │  │
│   │   [Moon Visual]  │            │  Illumination: ████░ 72% │
│   │                  │            │  Rise: 🔼 6:42 AM   │  │
│   │                  │            │  Set: 🔻 7:15 PM    │  │
│   │                  │            │  Altitude: ↗ 48°    │  │
│   │                  │            │  Direction: ↗ ESE    │  │
│   └──────────────────┘            │                      │  │
│                                    │  ⏱️ Next Event:      │  │
│                                    │  Full Moon in 5d 12h │  │
│                                    └──────────────────────┘  │
│                                                               │
└─────────────────────────────────────────────────────────────┘
```

### Mobile Layout (< 600px)
```
┌──────────────────────┐
│  🌙 MOONPHASE        │
├──────────────────────┤
│                      │
│    ╭─ Moon ─╮       │
│    │   ◐     │ Emoji│
│    ╰─────────╯ 🌓   │
│    Waxing Crescent  │
│                      │
│    72% Illuminated  │
│    ▓▓▓▓▓▓░░         │
│                      │
│    ⏱️ Full Moon      │
│    In 5 days 12h    │
│                      │
│  ┌─ Swipe for More ─┐│
│  │ [->] Details     ││
│  └──────────────────┘│
└──────────────────────┘
```

---

## 📱 Phase Timeline Carousel

### Visual Design
```
╔═══════════════════════════════════════════════════════════════════╗
║  LUNAR PHASE PROGRESSION - Scroll/Swipe to explore               ║
╠═══════════════════════════════════════════════════════════════════╣
║                                                                   ║
║  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐ ║
║  │ Apr 08  │  │ Apr 09  │  │ Apr 10  │  │ Apr 11  │  │ Apr 12  │ ║
║  │  🌑     │  │  🌒     │  │  🌓     │  │  🌔     │  │  🌕     │ ║
║  │ 18% ◀◀◀ │  │ 32% ◀◀▲ │  │ 52% ◀▲▲ │  │ 68% ▲▲▲ │  │ 95% ▲▲▲ │ ║
║  │ New     │  │ Waxing │  │ First   │  │ Waxing │  │ Full    │ ║
║  │ Moon    │  │Crescent│  │Quarter  │  │Gibbous │  │ Moon    │ ║
║  └─────────┘  └─────────┘  └─────────┘  └─────────┘  └─────────┘ ║
║                                  ↓                                  ║
║                         [Currently Selected]                       ║
║                                                                    ║
║  Details for Apr 10 (First Quarter):                              ║
║  • Rise: 12:34 PM  • Set: 12:47 AM                               ║
║  • Altitude Peak: 68°  • Best Viewing: 8:00 PM - Midnight        ║
║                                                                    ║
╚═══════════════════════════════════════════════════════════════════╝
```

### Interaction States
```
NORMAL CARD          HOVER CARD            SELECTED CARD
┌─────────┐         ┌─────────┐           ┌─────────┐
│ Apr 10  │ ─hover→ │ Apr 10  │ ─click→  │ Apr 10  │
│  🌓     │         │  🌓     │          │  🌓     │
│ 52% ▲▲  │         │ 52% ▲▲  │          │ 52% ▲▲  │
│ First   │         │ First   │          │ First   │
│ Quarter │         │ Quarter │          │ Quarter │
└─────────┘         └─────────┘          └─────────┘
(Faded text)        (Slight glow)        (✓ Checkmark,
(Low opacity)       (Slightly larger)    Bright border)
```

---

## 🌅 Dynamic Background System

### Visual Progression by Moon Phase
```
NEW MOON (0% illuminated)        WAXING GIBBOUS (75%)        FULL MOON (100%)
┌────────────────────────┐      ┌────────────────────────┐  ┌────────────────────────┐
│░░░░░░░░░░░░░░░░░░░░░░░░│      │▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│  │░░░░░░░░░░░░░░░░░░░░░░░░│
│░ [Stars twinkling]   ░░│      │▒▒ [Stars visible]   ▒▒│  │░ [Bright, almost day]░░│
│░░░░░░░░░░░░░░░░░░░░░░░░│      │▒ [Faint stars]     ▒▒│  │░░░░░░░░░░░░░░░░░░░░░░░░│
│                        │      │                        │  │                        │
│  Content Layer         │      │  Content Layer         │  │  Content Layer         │
│                        │      │                        │  │                        │
│░░░░░░░░░░░░░░░░░░░░░░░░│      │▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│  │░░░░░░░░░░░░░░░░░░░░░░░░│

#0B0B0F (Deep night)     #1A2A4A (Twilight)          #4A6A7A (Brightened)
```

### Glow Effect Intensity
```
Illumination:  0%        25%       50%      75%      100%
Glow:         None     ✓Subtle   ✓✓Med    ✓✓✓Bright ✓✓✓✓Intense
Background:   0B0B0F → 1A1A3E → 2A3A5A → 3A5A7A → 4A7A9A
Star opacity: 40%      35%       25%      10%      0%
```

---

## 🌍 Sky Path Visualization Enhancement

### Current vs. Proposed
```
CURRENT (Static canvas):         PROPOSED (Interactive, animated):
┌─────────────────────────┐     ┌─────────────────────────────────┐
│                         │     │  ⏯️ Play  ⏸️ Pause  ⏹️ Reset    │
│   Horizon View          │     │                                  │
│                         │     │        ZENITH (90°)             │
│      N                  │     │           ↑                     │
│      ↑                  │     │      [Blue Dome]                │
│  W ←   → E              │     │      /   \                       │
│      ↓                  │     │     / Sky \                      │
│      S                  │     │    |       |                    │
│                         │     │    |  ◐    |   (Hover: 8:15 PM │
│   [Simple moon line]    │     │    |       |   Alt: 62°, Az:130)│
│                         │     │     \     /                     │
│                         │     │      \   /                      │
│                         │     │    ──────────    HORIZON         │
│                         │     │    N  S  E  W                   │
│                         │     │                                  │
│                         │     │  Legend:                         │
│                         │     │  🟢 Moonrise  🟠 Moonset       │
│                         │     │  🔵 Current   🌕 Peak Alt      │
│                         │     │  ☀️ Sun Path (faded)            │
└─────────────────────────┘     └─────────────────────────────────┘
```

### Time Scrubber
```
Time Progression During Day:
┌─────────────────────────────────────────────────────────────┐
│  00:00 06:00 ●12:00 18:00 23:59                             │
│ ┌────────────●────────────────────────────────────────────┐ │
│ │ ────●────────────────────                               │ │
│ │     Sunrise                Moonset                       │ │
│ │ (alt: -5°) (alt: 62°)      (alt: -2°)                  │ │
│ └────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

---

## 📊 Enhanced Charts

### Moonrise/Moonset with Visibility Zones
```
Time (Hours)
│
│     OPTIMAL (20-80°)       CHALLENGING (0-20°)     IMPOSSIBLE
│
│     ┌─ Rise Curve ─┐       ╱─────────────╲         Below Horizon
│     │ (Green fill) │      ╱   (Yellow)    ╲       (Gray shade)
18:00├┐│             │     ╱                 ╲        ╱────────
     ││▓▓▓▓▓▓▓▓▓▓▓▓▓│    ╱                   ╲      ╱
06:00├┤▓▓▓▓▓▓▓▓▓▓▓▓▓│  ╱                       ╲    ╱
     ││▓▓▓▓▓▓▓▓▓▓▓▓▓│ ╱     ┌─ Set Curve ─┐     ╲  ╱
     │└────────────┘│ ╱      │ (Orange)    │      ╲╱
     │ MOONRISE     │       │             │
     │              │       └─────────────┘
     │              │
     └──────────────┴─────────────────────────
      Days    Apr 1 to Apr 30

Hover: "Apr 15, 10:42 AM - Altitude: 42°, Duration: 13h 45m"
Click: "Show details for this day"
```

### Illumination Percentage Chart
```
Illumination %
│
100%├────────────●────────────
    │          /  \
 75%├─────────●────●─────────
    │        /      \
 50%├──────●──────────●──────
    │     /            \
 25%├───●────────────────●───
    │  /                  \
  0%├─────────────────────────
    └─┬─────┬─────┬─────┬────
      Apr8  Apr15 Apr22 Apr29

Colors:
🟩 Optimal (60-100%)
🟨 Good (30-60%)
🟥 Poor (0-30%)

Hover Animation: Line draws and value counter animates
```

---

## 💳 Info Card Redesign

### Before (Current)
```
┌─────────────────────┐
│ MOON PHASE          │
│                     │
│ 🌓 Waxing Crescent  │
└─────────────────────┘
```

### After (Proposed)
```
┌──────────────────────────────────┐
│  🌓  MOON PHASE                  │
│  ────────────────────────────    │
│                                  │
│  Waxing Crescent                 │
│  (Starting to grow larger)       │
│                                  │
│  Days until Full: 5 ◀ Countdown  │
│  ▓▓▓▓▓░░░░░░░░░░░░░░░░░ (72%)  │
│                                  │
│  Next Phase: 🌔 Waxing Gibbous  │
│  (in 2 days)                     │
│                                  │
│  ⓘ Learn more about phases      │
└──────────────────────────────────┘
```

### Color-Coded Metrics
```
Primary Cards (Larger):              Secondary Cards (Smaller):
┌──────────────────────┐            ┌────────────┐  ┌────────────┐
│ 🌕 ILLUMINATION      │            │ 🔼 RISE    │  │ 🔻 SET     │
│ (Yellow accent)      │            │ (Green)    │  │ (Green)    │
│                      │            │            │  │            │
│ ████████░░ 72%      │            │ 6:42 AM   │  │ 7:15 PM   │
│ Increasing ↗         │            │ 2h 34m ago│  │ in 8h 20m │
└──────────────────────┘            └────────────┘  └────────────┘

┌──────────────────────┐            ┌────────────┐  ┌────────────┐
│ 🌙 PHASE             │            │ ↗ ALTITUDE │  │ ↗ AZIMUTH  │
│ (Cyan accent)        │            │ (Blue)     │  │ (Purple)   │
│                      │            │            │  │            │
│ Waxing Crescent      │            │ 48°        │  │ 128° SE    │
│ 🌒🌓🌔🌕 Timeline    │            │ Visible ✓  │  │ Above horiz│
└──────────────────────┘            └────────────┘  └────────────┘
```

---

## 📱 Responsive Grid Transformation

### Desktop (> 1000px)
```
┌───────────────────────────────────────────────────────────────┐
│ Hero Section (Full Width)                                     │
├───────────────────────────────────────────────────────────────┤
│  Primary Card  │  Secondary Cards Grid                         │
│  (70%)         │  ┌─────────┬─────────┐                       │
│                │  │ Rise    │ Set     │                       │
│ [Moon viz]     │  └─────────┴─────────┘                       │
│                │  ┌─────────┬─────────┐                       │
│                │  │ Altitude│ Azimuth │                       │
│                │  └─────────┴─────────┘                       │
├───────────────────────────────────────────────────────────────┤
│ Phase Timeline Carousel (Full Width)                          │
├───────────────────────────────────────────────────────────────┤
│ Chart 1 (50%)  │  Chart 2 (50%)                               │
│ Rise/Set       │  Altitude                                     │
├───────────────────────────────────────────────────────────────┤
│ Sky Diagram (Full Width)                                       │
├───────────────────────────────────────────────────────────────┤
│ Calendar (Full Width)                                          │
└───────────────────────────────────────────────────────────────┘
```

### Tablet (600-1000px)
```
┌──────────────────────────────┐
│ Hero (Full Width, Compact)   │
├──────────────────────────────┤
│ Moon │ Stats Grid (Stacked)  │
├──────────────────────────────┤
│ Phase Timeline (Full Width)  │
├──────────────────────────────┤
│ Chart 1 (Full Width)         │
├──────────────────────────────┤
│ Chart 2 (Full Width)         │
├──────────────────────────────┤
│ Sky Diagram (Full Width)     │
├──────────────────────────────┤
│ Calendar (Full Width)        │
└──────────────────────────────┘
```

### Mobile (< 600px)
```
┌──────────────────┐
│ Compact Hero     │
│ [Moon] Phase     │
│ 72% Illuminated  │
├──────────────────┤
│ Swipe: Details   │
│ [Details >>>]    │
├──────────────────┤
│ Timeline         │
│ [Horizontal]     │
├──────────────────┤
│ [Expandable]     │
│ Charts & Data    │
├──────────────────┤
│ [Expandable]     │
│ Sky Diagram      │
├──────────────────┤
│ [Expandable]     │
│ Calendar         │
└──────────────────┘
```

---

## 🎨 Color Applications by Component

```
Component          Primary Color    Secondary Color   Accent Color
─────────────────────────────────────────────────────────────────
Moon Phase         #E8E8E8          #FFD700           #00D4FF
Illumination       #FFD700 ▓         #666666 ░         #FFD700
Rise/Set Times     #00FF7F           #0B7E0B          #00D4FF
Altitude           #1E90FF           #000080          #00D4FF
Azimuth            #9370DB           #4B0082          #00D4FF
Background         #0B0B0F           #1A2A4A (glow)   #00D4FF
Cards              #0F3460 + blur    #16213E          #E94560
Buttons            #E94560           #FF6B7A          #00D4FF
Text (Primary)     #E8E8E8           #FFFFFF          N/A
Text (Secondary)   #AAAAAA           #888888          N/A
Text (Accent)      #00D4FF           #FFD700          N/A
```

---

## ✨ Animation Specifications

### Hero Moon on Page Load
```
Keyframes:
0%    → Position: bottom, Scale: 0.8, Opacity: 0
50%   → Position: center, Scale: 1.0, Opacity: 0.5
100%  → Position: center, Scale: 1.0, Opacity: 1.0

Duration: 800ms
Easing: cubic-bezier(0.34, 1.56, 0.64, 1)
```

### Illumination Bar Fill
```
0%    → Width: 0%, Color: #00FF7F
Fill% → Width: {illumination}%, Color: #FFD700 (interpolated)

Duration: 400ms
Easing: ease-out
Trigger: On data update
```

### Chart Data Entry
```
Each point appears with staggered timing:
- Point 1: 100ms
- Point 2: 120ms
- Point 3: 140ms
... (increment by 20ms per point)

Drawing effect creates left-to-right line appearance
Duration per point: 300ms
Easing: ease-in-out
```

### Card Hover Effects
```
Default:
- Background: rgba(15, 52, 96, 0.6)
- Scale: 1.0
- Shadow: 0 2px 8px rgba(0,0,0,0.1)

Hover:
- Background: rgba(15, 52, 96, 0.8)
- Scale: 1.02
- Shadow: 0 8px 24px rgba(0,212,255,0.2)
- Transition: 200ms ease-out

Active/Selected:
- Scale: 1.05
- Border: 2px solid #00D4FF
- Shadow: 0 0 16px rgba(0,212,255,0.4)
```

---

## 🎯 Typography Hierarchy

```
Page Title (H1)
2.5em, Bold, #E8E8E8
Letter-spacing: +2px
Text-shadow: 0 2px 10px rgba(0,0,0,0.5)

Section Headers (H2)
1.8em, Semi-bold, #00D4FF
Border-bottom: 2px solid #E94560
Padding-bottom: 10px
Margin: 30px 0 20px 0

Card Titles (H3)
0.9em, Uppercase, #00D4FF
Letter-spacing: +1px
Margin-bottom: 10px

Body Text
1em, Regular, #E8E8E8
Line-height: 1.6

Labels (Data Points)
0.9em, Regular, #AAAAAA
Letter-spacing: 0.5px

Values (Numbers)
1.5em, Bold, #FFFFFF
(In info boxes)

Captions
0.85em, Light, #888888
Line-height: 1.4
```

---

## 🎬 Micro-interaction Examples

### Location Search Feedback
```
INPUT: User types "Tokyo"
FEEDBACK:
  • Border changes to #00D4FF (soft glow)
  • Autocomplete dropdown appears below with suggestions
  • Each suggestion has hover state (background highlight)
  • Selection updates map thumbnail

RESULT DISPLAY:
  • Smooth transition to new location data
  • Background gradient shifts to new time zone's lighting
  • Moon position updates with 400ms animation
  • All charts re-animate
  • Success: "✓ Tokyo loaded" (brief toast, 2 seconds)
```

### Dark Mode Theme Switch
```
Toggle Theme: Nebula → Moonlight
Duration: 300ms

Effects:
  • Color palette transitions smoothly
  • Primary: #00D4FF → #C0C0C0
  • Accent: #E94560 → #87CEEB
  • Background stars fade/brighten
  • Moon glow adjusts to new palette
  • All text colors transition
  • No jarring flashes

Easing: ease-in-out
```

---

## 🚀 Implementation Priority

**CRITICAL PATH** (MVP - 2-3 weeks):
1. [ ] Hero section with animated moon graphics
2. [ ] Phase timeline carousel
3. [ ] Responsive mobile reorganization
4. [ ] Color-coded info cards

**HIGH PRIORITY** (Next - 2-3 weeks):
1. [ ] Enhanced chart interactions
2. [ ] Interactive sky path diagram
3. [ ] Dynamic background system
4. [ ] Info tooltips & progressive disclosure

**MEDIUM PRIORITY** (Polish - 1-2 weeks):
1. [ ] Theme switcher
2. [ ] Time traveler slider
3. [ ] Advanced animations
4. [ ] Performance optimization

**NICE-TO-HAVE** (Future):
1. [ ] Social sharing
2. [ ] AR moon viewer
3. [ ] Multi-location comparison
4. [ ] Advanced predictive features

---

Generated: April 14, 2026
Status: Design Specifications Ready for Implementation
