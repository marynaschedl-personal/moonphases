# Phase 1 Testing Guide

## 🚀 How to See Your Changes

### Quick Start (Choose One)

#### Option A: Use Vercel (Recommended)
Your site is already hosted! Just visit:
- **Production**: https://moonphase.vercel.app (if deployed)
- **Local preview**: Push to GitHub and Vercel auto-deploys

#### Option B: Run Locally
```bash
# Option 1: Python
cd C:/Users/DSche/moonphase
python -m http.server 8000
# Then open http://localhost:8000

# Option 2: Node (if you have npm)
cd C:/Users/DSche/moonphase
npx http-server -p 8000
# Then open http://localhost:8000

# Option 3: VS Code
# Right-click index.html → "Open with Live Server"
```

---

## ✅ What to Look For

### 1. Hero Moon Animation
**When**: Page loads
**Look For**: 
- Moon circle **smoothly scales up and fades in** from bottom
- Animation lasts ~800ms
- Should feel smooth and not jerky

**How to Test**:
1. Refresh the page (Ctrl+R)
2. Watch the moon circle in the header
3. Should slide up while fading in

**Expected**:
```
Page load → Moon: small + transparent
           → (animating)
           → Moon: full size + opaque ✓
```

---

### 2. Full Moon Glow
**When**: Illumination > 90%
**Look For**:
- Soft gold glow around moon circle
- Glow pulses in and out smoothly
- Creates a "breathing" effect

**How to Test**:
1. Change location to somewhere with full moon high (search "full moon today")
2. Or wait for actual full moon
3. Look for golden glow around moon visual

**Expected**:
```
Illumination ~90%+ → Moon gets golden glow
                   → Glow pulses continuously ✓
```

---

### 3. Dynamic Background
**When**: Page loads and changes with moon phase
**Look For**:
- Background color changes based on moon illumination
- **New Moon**: Very dark (#0B0B0F)
- **Crescent**: Dark with hint of gold
- **Full Moon**: Noticeably brighter
- Smooth transition between states (800ms)

**How to Test**:
1. Load the page (should be dark if new moon)
2. Click through timeline to different dates
3. Watch background brighten as moon gets fuller
4. Watch background darken for new moon dates

**Expected Progression**:
```
New Moon (0-10%)     → Very dark background (#0B0B0F)
Crescent (10-25%)    → Dark with gold tint (#0F0F1F)
Quarter (25-75%)     → Medium brightness (#1A2A3A)
Full Moon (75-100%)  → Bright with gold glow (#3A5A6A)
```

**Test**: Scroll timeline left/right and watch colors shift smoothly

---

### 4. Enhanced Info Cards
**Look For**:
- **Icons**: 🌙 💡 🔼 🔻 appear next to labels
- **Colors**: 
  - Moon Phase: Cyan border
  - Illumination: Gold border
  - Rise Time: Green border
  - Set Time: Green border
- **Progress Bar**: Under illumination, shows filled bar (0-100%)
- **Hover Effect**: Cards slightly lift on mouse hover

**How to Test**:
1. Look at the info boxes at top
2. Check each has its icon (🌙, 💡, 🔼, 🔻)
3. Check border colors match:
   - Left: 🌙 cyan
   - Left: 💡 gold
   - Left: 🔼 green
   - Left: 🔻 green
4. Hover over any card → should lift slightly with shadow
5. Look for progress bar under illumination value

**Expected Visual**:
```
┌──────────────────┐
│ 🌙 MOON PHASE    │ ← Cyan border
│ 🌕 Full Moon     │
└──────────────────┘

┌──────────────────┐
│ 💡 ILLUMINATION  │ ← Gold border
│ 95%              │
│ ▓▓▓▓▓░░░░░░      │ ← Progress bar
└──────────────────┘
```

---

### 5. Phase Timeline Carousel
**Location**: Below info boxes
**Look For**:
- **Horizontal scrolling** cards showing 30 days
- **Today highlighted**: Red/pink border around today's date
- **Each card shows**: Date, emoji (🌑🌒🌓🌕), illumination %, phase name
- **Scrolling**: Smooth scroll, can swipe on mobile
- **Click action**: Click any date → details appear below
- **Hover effect**: Cards lift slightly on hover

**How to Test**:

1. **Find the timeline**:
   - Look for section titled "Lunar Phase Progression - Next 30 Days"
   - Below the four info cards

2. **Check scrolling**:
   - Should have ~30 small cards in a row
   - Today's card has red/pink border
   - Scroll left/right smoothly

3. **Click to select**:
   - Click a date card (e.g., April 20)
   - Card border changes to red
   - Details section below updates with info for that date

4. **Check details panel**:
   - Shows date, illumination %, rise/set times, altitude
   - Updates when you click different dates

**Expected Timeline Card**:
```
┌──────────┐
│ Apr 15   │
│   🌔     │ ← Moon emoji
│  68%     │ ← Illumination
│ Gibbous  │ ← Phase name
└──────────┘
(hover → lifts up with glow)
```

---

### 6. Mobile Responsiveness
**How to Test**:

#### Desktop View (1920x1080 or larger)
- 4 info cards in a row
- 2 charts side-by-side
- Horizontal timeline carousel
- Everything should have plenty of space

#### Tablet View (768x1024)
1. Open DevTools (F12)
2. Click device toolbar (top left)
3. Select iPad
4. Layout changes to:
   - 2 info cards per row
   - 1 chart per row (stacked)
   - Timeline still horizontal

#### Mobile View (375x812)
1. Open DevTools (F12)
2. Click device toolbar
3. Select iPhone 12
4. Layout changes to:
   - 1 info card per row
   - 1 chart per row (vertical stack)
   - Timeline horizontal (scrollable)
   - Moon circle smaller (120px vs 150px)
   - Better readability

**Expected Mobile Layout**:
```
┌─────────────┐
│ 🌙 Info Card│  ← Full width
└─────────────┘
┌─────────────┐
│ 💡 Info Card│  ← One per row
└─────────────┘
┌─────────────┐
│ Chart        │  ← Full width
└─────────────┘
┌─────────────┐
│ Timeline    │  ← Scrollable
│ ┌─┐┌─┐┌─┐  │     horizontal
│ │ ││ ││ │  │
└─────────────┘
```

---

## 🔍 Detailed Inspection

### Check Background Colors
**Use DevTools**:
1. Right-click → Inspect
2. Select `<body>` element
3. Look at Styles panel
4. Find `background` property
5. Should show `linear-gradient(135deg, ...)`
6. Color changes when clicking timeline

### Check Timeline JavaScript
**In Console** (F12 → Console):
```javascript
// Test moon data calculation
const date = new Date();
const moonData = calculateMoonData(date);
console.log(moonData); // Shows illumination, phase, etc.

// Test timeline generation
createPhaseTimeline(new Date());
console.log('Timeline created');
```

### Performance Check
**Use Lighthouse**:
1. Open DevTools (F12)
2. Go to Lighthouse tab
3. Click "Analyze page load"
4. Should see score > 80 (ideally > 90)
5. Check Performance metrics

---

## 📱 Device Testing

### Test on Real Devices

#### iPhone
- Open in Safari
- Swipe timeline left/right (should be smooth)
- Tap cards to select dates
- Background should respond to moon phase
- Font should be readable without zoom

#### Android
- Open in Chrome
- Test touch scrolling on timeline
- Tap cards work smoothly
- No horizontal scroll bar
- Icons display correctly

#### iPad / Tablet
- Both portrait and landscape
- Cards should reflow properly
- Timeline should scroll smoothly
- Spacing should look balanced

---

## 🎯 Feature Checklist

### Hero Animations
- [ ] Moon scales up from bottom on load
- [ ] Animation lasts ~800ms
- [ ] Full moon has pulsing gold glow
- [ ] No animation if browser has `prefers-reduced-motion`

### Background Dynamics
- [ ] New moon = very dark (#0B0B0F)
- [ ] Full moon = bright (#3A5A6A)
- [ ] Smooth 800ms transition between states
- [ ] Glow box-shadow matches illumination

### Info Cards
- [ ] 🌙 Moon Phase has cyan border
- [ ] 💡 Illumination has gold border
- [ ] 🔼 Rise has green border
- [ ] 🔻 Set has green border
- [ ] Icons display correctly
- [ ] Hover effect works (lift + shadow)
- [ ] Progress bar fills from 0-100%

### Timeline Carousel
- [ ] Shows 30 days of phases
- [ ] Today is highlighted with red border
- [ ] Scrolls smoothly (horizontal)
- [ ] Click selects date (border changes)
- [ ] Details panel updates on click
- [ ] Smooth scroll animation when clicking
- [ ] Touch-scrollable on mobile

### Responsive Design
- [ ] Desktop: 4 columns, 2 charts side-by-side
- [ ] Tablet: 2 columns, 1 chart per row
- [ ] Mobile: 1 column, all stacked
- [ ] No horizontal scrollbar on mobile
- [ ] Text readable at all sizes
- [ ] Touch targets > 48px on mobile

---

## 🐛 Troubleshooting

### Moon animation doesn't play
**Problem**: Hero moon doesn't animate on page load
**Solution**:
1. Hard refresh (Ctrl+Shift+R)
2. Check console (F12) for errors
3. Verify `.moon-circle` has `animation: heroMoonAppear`

### Background doesn't change
**Problem**: Background stays same color regardless of moon phase
**Solution**:
1. Check if `updateBackgroundByPhase()` is being called
2. Console: `console.log(document.querySelector('body').style.background)`
3. Should show gradient string
4. Verify `calculateMoonData()` returns valid illumination value

### Timeline doesn't appear
**Problem**: Timeline section is missing
**Solution**:
1. Search for "Lunar Phase Progression" in page
2. Ctrl+F search in browser
3. If not found, check if HTML was saved properly
4. Refresh and check network tab in DevTools

### Cards don't have colors
**Problem**: Info boxes don't have colored borders
**Solution**:
1. Inspect element with F12
2. Check if classes like `info-box--phase` are applied
3. Look in Styles panel for color rules
4. Verify CSS file is loaded (no 404 in Network tab)

### Mobile layout broken
**Problem**: Mobile view shows 2+ columns or is cramped
**Solution**:
1. Make sure viewport meta tag is present: 
   `<meta name="viewport" content="width=device-width, initial-scale=1.0">`
2. Test with DevTools device emulation
3. Hard refresh
4. Try different mobile device in DevTools

---

## 📊 Performance Benchmarks

### Expected Performance

| Metric | Target | Actual |
|--------|--------|--------|
| Page Load | < 2s | ~1-1.5s |
| Hero Animation | Smooth | 60fps |
| Background Transition | 800ms | Smooth |
| Timeline Scroll | Smooth | 60fps |
| Click to Details | Instant | < 10ms |
| Lighthouse Score | > 85 | Aiming for 90+ |

### To Measure
1. Open DevTools (F12)
2. Go to Network tab
3. Do a hard refresh (Ctrl+Shift+R)
4. Check:
   - Total load time
   - index.html size
   - No failed requests (red)

---

## 📸 Screenshots to Compare

### Before Phase 1
- Static moon circle, no animation
- Plain info boxes
- Static background
- No timeline carousel
- Cramped mobile layout

### After Phase 1
- Animated moon that glows
- Color-coded cards with icons
- Dynamic background by phase
- Interactive timeline carousel
- Optimized mobile layout

---

## 🎉 Success Criteria

**Phase 1 is successful when:**

✅ All 5 improvements are visible and working
✅ No console errors in DevTools
✅ Smooth animations (no jank)
✅ Mobile layout reflows correctly at 375px width
✅ Timeline carousel scrolls and responds to clicks
✅ Background colors change with illumination
✅ Lighthouse score > 85
✅ Works on Chrome, Firefox, Safari, Edge

---

**Ready to test?** Open your browser and follow the "Quick Start" section above!

**Questions?** Check the troubleshooting section or review PHASE1-IMPLEMENTATION.md for more details.

---

Generated: April 14, 2026
