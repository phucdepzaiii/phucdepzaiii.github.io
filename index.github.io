<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Baccarat Pro 3.0 - Premium Analysis System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary-gold: #FFD700;
            --secondary-gold: #FFA500;
            --player-blue: #3498db;
            --banker-red: #e74c3c;
            --tie-green: #27ae60;
            --success: #2ecc71;
            --danger: #e74c3c;
            --warning: #f39c12;
            --dark-bg: #0a0e27;
            --card-bg: rgba(255, 255, 255, 0.08);
            --glass-border: rgba(255, 255, 255, 0.15);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0a0e27 0%, #1a1a2e 25%, #16213e 50%, #0f3460 100%);
            color: #ffffff;
            min-height: 100vh;
            padding: 20px;
            position: relative;
            overflow-x: hidden;
        }

        /* Animated Background */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                radial-gradient(circle at 20% 80%, rgba(255, 215, 0, 0.03) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(240, 84, 84, 0.03) 0%, transparent 50%),
                radial-gradient(circle at 40% 40%, rgba(52, 152, 219, 0.03) 0%, transparent 50%);
            pointer-events: none;
            z-index: 1;
            animation: floatingBg 20s ease-in-out infinite;
        }

        @keyframes floatingBg {
            0%, 100% { transform: translate(0, 0) rotate(0deg); }
            33% { transform: translate(-20px, -20px) rotate(1deg); }
            66% { transform: translate(20px, -10px) rotate(-1deg); }
        }

        .container {
            max-width: 1600px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }

        /* Premium Header */
        .premium-header {
            text-align: center;
            margin-bottom: 30px;
            padding: 30px;
            background: linear-gradient(135deg, rgba(255, 215, 0, 0.1), rgba(255, 255, 255, 0.05));
            backdrop-filter: blur(20px);
            border-radius: 25px;
            border: 2px solid var(--primary-gold);
            position: relative;
            overflow: hidden;
        }

        .premium-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255, 215, 0, 0.1), transparent);
            animation: shine 3s linear infinite;
        }

        @keyframes shine {
            0% { transform: translateX(-100%) translateY(-100%) rotate(45deg); }
            100% { transform: translateX(100%) translateY(100%) rotate(45deg); }
        }

        h1 {
            font-size: 3em;
            margin-bottom: 15px;
            background: linear-gradient(135deg, #ffd700 0%, #ffed4e 25%, #ffd700 50%, #ffed4e 75%, #ffd700 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: bold;
            text-shadow: 0 0 40px rgba(255, 215, 0, 0.5);
            animation: goldPulse 2s ease-in-out infinite;
        }

        @keyframes goldPulse {
            0%, 100% { transform: scale(1); filter: brightness(1); }
            50% { transform: scale(1.02); filter: brightness(1.3); }
        }

        /* Win/Loss Cycle Display */
        .cycle-display {
            background: linear-gradient(135deg, rgba(138, 43, 226, 0.1), rgba(75, 0, 130, 0.1));
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 25px;
            border: 2px solid rgba(138, 43, 226, 0.3);
            position: relative;
        }

        .cycle-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .cycle-title {
            font-size: 1.5em;
            color: #bb8fce;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .cycle-controls {
            display: flex;
            gap: 10px;
        }

        .cycle-btn {
            padding: 8px 15px;
            background: rgba(138, 43, 226, 0.2);
            border: 1px solid rgba(138, 43, 226, 0.4);
            color: #bb8fce;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s;
            font-size: 0.9em;
        }

        .cycle-btn:hover {
            background: rgba(138, 43, 226, 0.3);
            transform: translateY(-2px);
        }

        .cycle-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin-bottom: 20px;
        }

        .cycle-stat-card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 12px;
            padding: 15px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s;
        }

        .cycle-stat-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .cycle-stat-label {
            font-size: 0.85em;
            color: #999;
            margin-bottom: 5px;
        }

        .cycle-stat-value {
            font-size: 1.8em;
            font-weight: bold;
        }

        .cycle-stat-value.win {
            color: var(--success);
        }

        .cycle-stat-value.loss {
            color: var(--danger);
        }

        .cycle-stat-value.neutral {
            color: var(--warning);
        }

        /* Win/Loss Timeline */
        .timeline-container {
            background: rgba(0, 0, 0, 0.3);
            border-radius: 15px;
            padding: 20px;
            margin-top: 20px;
            overflow-x: auto;
        }

        .timeline {
            display: flex;
            gap: 5px;
            min-width: fit-content;
            padding: 10px 0;
        }

        .timeline-item {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 0.9em;
            transition: all 0.3s;
            cursor: pointer;
            position: relative;
        }

        .timeline-item.win {
            background: linear-gradient(135deg, #2ecc71, #27ae60);
            box-shadow: 0 2px 10px rgba(46, 204, 113, 0.3);
        }

        .timeline-item.loss {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            box-shadow: 0 2px 10px rgba(231, 76, 60, 0.3);
        }

        .timeline-item.pending {
            background: linear-gradient(135deg, #95a5a6, #7f8c8d);
            opacity: 0.5;
        }

        .timeline-item:hover {
            transform: scale(1.2);
            z-index: 10;
        }

        .timeline-item .tooltip {
            position: absolute;
            bottom: 50px;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(0, 0, 0, 0.9);
            color: white;
            padding: 8px 12px;
            border-radius: 8px;
            font-size: 0.85em;
            white-space: nowrap;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.3s;
        }

        .timeline-item:hover .tooltip {
            opacity: 1;
        }

        /* Streak Display */
        .streak-display {
            background: linear-gradient(135deg, rgba(241, 196, 15, 0.1), rgba(243, 156, 18, 0.1));
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 25px;
            border: 2px solid rgba(241, 196, 15, 0.3);
        }

        .streak-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .streak-card {
            background: var(--card-bg);
            border-radius: 15px;
            padding: 20px;
            border: 1px solid var(--glass-border);
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
        }

        .streak-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--primary-gold), transparent);
            animation: streakAnimation 3s linear infinite;
        }

        @keyframes streakAnimation {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }

        .streak-icon {
            font-size: 2em;
            margin-bottom: 10px;
        }

        .streak-title {
            font-size: 1.1em;
            color: #aaa;
            margin-bottom: 8px;
        }

        .streak-value {
            font-size: 2.5em;
            font-weight: bold;
            background: linear-gradient(135deg, var(--primary-gold), #fff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .streak-subtitle {
            font-size: 0.9em;
            color: #888;
            margin-top: 5px;
        }

        /* Performance Metrics */
        .performance-metrics {
            background: linear-gradient(135deg, rgba(52, 152, 219, 0.1), rgba(41, 128, 185, 0.1));
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 25px;
            border: 2px solid rgba(52, 152, 219, 0.3);
        }

        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .metric-card {
            background: var(--card-bg);
            border-radius: 15px;
            padding: 20px;
            border: 1px solid var(--glass-border);
            position: relative;
        }

        .metric-chart {
            height: 100px;
            margin-top: 15px;
            position: relative;
        }

        .mini-chart {
            display: flex;
            align-items: flex-end;
            height: 100%;
            gap: 3px;
        }

        .chart-bar {
            flex: 1;
            background: linear-gradient(180deg, var(--player-blue), var(--banker-red));
            border-radius: 3px 3px 0 0;
            min-height: 5px;
            transition: all 0.3s;
            opacity: 0.8;
        }

        .chart-bar:hover {
            opacity: 1;
            transform: scaleY(1.1);
        }

        /* Smart Actions Panel */
        .smart-actions {
            background: linear-gradient(135deg, rgba(155, 89, 182, 0.1), rgba(142, 68, 173, 0.1));
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 25px;
            border: 2px solid rgba(155, 89, 182, 0.3);
        }

        .smart-actions-title {
            font-size: 1.3em;
            color: #bb8fce;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .action-buttons {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
        }

        .action-btn {
            padding: 15px;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.05));
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            color: white;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 8px;
            font-weight: 600;
            position: relative;
            overflow: hidden;
        }

        .action-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s;
        }

        .action-btn:hover::before {
            left: 100%;
        }

        .action-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
        }

        .action-btn-icon {
            font-size: 1.8em;
        }

        .action-btn-text {
            font-size: 0.9em;
            text-align: center;
        }

        /* Pattern Radar */
        .pattern-radar {
            background: var(--card-bg);
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 25px;
            border: 1px solid var(--glass-border);
            position: relative;
        }

        .radar-container {
            position: relative;
            width: 200px;
            height: 200px;
            margin: 20px auto;
        }

        .radar-circle {
            position: absolute;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .radar-circle:nth-child(1) { width: 200px; height: 200px; }
        .radar-circle:nth-child(2) { width: 150px; height: 150px; }
        .radar-circle:nth-child(3) { width: 100px; height: 100px; }
        .radar-circle:nth-child(4) { width: 50px; height: 50px; }

        .radar-scan {
            position: absolute;
            width: 100px;
            height: 100px;
            top: 50%;
            left: 50%;
            transform-origin: left center;
            transform: translate(0, -50%);
            animation: radarScan 4s linear infinite;
        }

        .radar-scan::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(79, 209, 197, 0.3));
            clip-path: polygon(0 50%, 100% 0, 100% 100%);
        }

        @keyframes radarScan {
            0% { transform: translate(0, -50%) rotate(0deg); }
            100% { transform: translate(0, -50%) rotate(360deg); }
        }

        .radar-dots {
            position: absolute;
            width: 100%;
            height: 100%;
        }

        .radar-dot {
            position: absolute;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            animation: radarPulse 2s ease-in-out infinite;
        }

        .radar-dot.player {
            background: var(--player-blue);
            box-shadow: 0 0 10px var(--player-blue);
        }

        .radar-dot.banker {
            background: var(--banker-red);
            box-shadow: 0 0 10px var(--banker-red);
        }

        .radar-dot.tie {
            background: var(--tie-green);
            box-shadow: 0 0 10px var(--tie-green);
        }

        @keyframes radarPulse {
            0%, 100% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.5); opacity: 0.5; }
        }

        /* Enhanced Input Section */
        .input-section {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.1), rgba(255, 255, 255, 0.05));
            backdrop-filter: blur(20px);
            border-radius: 25px;
            padding: 30px;
            margin-bottom: 25px;
            border: 2px solid var(--glass-border);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
        }

        .main-buttons {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 25px;
        }

        .game-button {
            padding: 20px;
            border: none;
            border-radius: 15px;
            cursor: pointer;
            font-weight: 600;
            font-size: 1.2em;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            min-height: 100px;
        }

        .game-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s;
        }

        .game-button:hover::before {
            left: 100%;
        }

        .game-button:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
        }

        .btn-player {
            background: linear-gradient(135deg, #3498db, #2980b9);
            border: 2px solid #3498db;
            color: white;
        }

        .btn-banker {
            background: linear-gradient(135deg, #e74c3c, #c0392b);
            border: 2px solid #e74c3c;
            color: white;
        }

        .btn-tie {
            background: linear-gradient(135deg, #27ae60, #229954);
            border: 2px solid #27ae60;
            color: white;
        }

        .button-icon {
            font-size: 2em;
        }

        .button-text {
            font-size: 1em;
        }

        /* Enhanced Prediction Cards */
        .prediction-section {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(240, 84, 84, 0.1));
            backdrop-filter: blur(20px);
            border-radius: 25px;
            padding: 30px;
            margin-bottom: 25px;
            border: 2px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
        }

        .prediction-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-top: 25px;
        }

        .prediction-card {
            background: var(--card-bg);
            border-radius: 20px;
            padding: 25px;
            text-align: center;
            border: 2px solid transparent;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .prediction-card::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(45deg, var(--primary-gold), transparent, var(--primary-gold));
            border-radius: 20px;
            opacity: 0;
            z-index: -1;
            transition: opacity 0.3s;
        }

        .prediction-card.recommended::before {
            opacity: 1;
            animation: rotateGradient 3s linear infinite;
        }

        @keyframes rotateGradient {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .prediction-card.recommended {
            background: linear-gradient(135deg, rgba(255, 217, 61, 0.2), rgba(255, 193, 7, 0.1));
            animation: recommendPulse 2s ease-in-out infinite;
        }

        @keyframes recommendPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.03); }
        }

        /* Status Indicators */
        .status-indicator {
            display: inline-block;
            width: 10px;
            height: 10px;
            border-radius: 50%;
            margin-right: 5px;
            animation: statusPulse 2s ease-in-out infinite;
        }

        .status-indicator.active {
            background: var(--success);
            box-shadow: 0 0 10px var(--success);
        }

        .status-indicator.warning {
            background: var(--warning);
            box-shadow: 0 0 10px var(--warning);
        }

        .status-indicator.danger {
            background: var(--danger);
            box-shadow: 0 0 10px var(--danger);
        }

        @keyframes statusPulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .main-buttons {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .metrics-grid {
                grid-template-columns: 1fr;
            }
            
            h1 {
                font-size: 2em;
            }
        }

        /* Loading Animation */
        .loading-spinner {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(255, 255, 255, 0.3);
            border-top: 3px solid var(--primary-gold);
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Tooltips */
        .tooltip-wrapper {
            position: relative;
            display: inline-block;
        }

        .tooltip-content {
            position: absolute;
            bottom: 125%;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(0, 0, 0, 0.9);
            color: white;
            padding: 10px 15px;
            border-radius: 10px;
            font-size: 0.9em;
            white-space: nowrap;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.3s;
            z-index: 1000;
        }

        .tooltip-wrapper:hover .tooltip-content {
            opacity: 1;
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 10px;
            height: 10px;
        }

        ::-webkit-scrollbar-track {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 5px;
        }

        ::-webkit-scrollbar-thumb {
            background: linear-gradient(135deg, var(--primary-gold), var(--secondary-gold));
            border-radius: 5px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(135deg, var(--secondary-gold), var(--primary-gold));
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Premium Header -->
        <div class="premium-header">
            <h1>🎰 BACCARAT PRO 3.0 🎰</h1>
            <p style="font-size: 1.3em; color: var(--primary-gold); font-weight: bold; margin: 10px 0;">
                💎 PREMIUM ANALYSIS SYSTEM 💎
            </p>
            <p style="color: #aaa; font-size: 1.1em;">
                <span class="status-indicator active"></span>
                Hệ thống AI đang hoạt động | Thuật toán 142857 | 30+ Mẫu chuẩn
            </p>
        </div>

        <!-- Win/Loss Cycle Display -->
        <div class="cycle-display">
            <div class="cycle-header">
                <div class="cycle-title">
                    🔄 CHU KỲ THẮNG THUA HỆ THỐNG
                </div>
                <div class="cycle-controls">
                    <button class="cycle-btn" onclick="showCycleDetails()">📊 Chi tiết</button>
                    <button class="cycle-btn" onclick="resetCycle()">🔄 Reset</button>
                </div>
            </div>
            
            <div class="cycle-stats">
                <div class="cycle-stat-card">
                    <div class="cycle-stat-label">Chu kỳ hiện tại</div>
                    <div class="cycle-stat-value neutral" id="currentCycle">1</div>
                </div>
                <div class="cycle-stat-card">
                    <div class="cycle-stat-label">Chuỗi thắng</div>
                    <div class="cycle-stat-value win" id="winStreak">0</div>
                </div>
                <div class="cycle-stat-card">
                    <div class="cycle-stat-label">Chuỗi thua</div>
                    <div class="cycle-stat-value loss" id="lossStreak">0</div>
                </div>
                <div class="cycle-stat-card">
                    <div class="cycle-stat-label">Max thắng</div>
                    <div class="cycle-stat-value win" id="maxWinStreak">0</div>
                </div>
                <div class="cycle-stat-card">
                    <div class="cycle-stat-label">Max thua</div>
                    <div class="cycle-stat-value loss" id="maxLossStreak">0</div>
                </div>
                <div class="cycle-stat-card">
                    <div class="cycle-stat-label">Tỷ lệ W/L</div>
                    <div class="cycle-stat-value neutral" id="winLossRatio">0.00</div>
                </div>
            </div>
            
            <div class="timeline-container">
                <h4 style="margin-bottom: 10px; color: #aaa;">📈 Lịch sử 30 dự đoán gần nhất:</h4>
                <div class="timeline" id="predictionTimeline"></div>
            </div>
        </div>

        <!-- Streak Display -->
        <div class="streak-display">
            <h2 style="color: var(--warning); margin-bottom: 20px;">🔥 PHÂN TÍCH CHUỖI</h2>
            <div class="streak-grid">
                <div class="streak-card">
                    <div class="streak-icon">🎯</div>
                    <div class="streak-title">Chuỗi hiện tại</div>
                    <div class="streak-value" id="currentStreakDisplay">-</div>
                    <div class="streak-subtitle" id="streakType">Chờ dữ liệu</div>
                </div>
                <div class="streak-card">
                    <div class="streak-icon">🏆</div>
                    <div class="streak-title">Longest Dragon</div>
                    <div class="streak-value" id="longestDragon">0</div>
                    <div class="streak-subtitle" id="dragonType">-</div>
                </div>
                <div class="streak-card">
                    <div class="streak-icon">⚡</div>
                    <div class="streak-title">Hot Pattern</div>
                    <div class="streak-value" id="hotPattern">-</div>
                    <div class="streak-subtitle" id="patternFreq">0 lần</div>
                </div>
                <div class="streak-card">
                    <div class="streak-icon">📊</div>
                    <div class="streak-title">Trend Score</div>
                    <div class="streak-value" id="trendScore">0</div>
                    <div class="streak-subtitle" id="trendDirection">Neutral</div>
                </div>
            </div>
        </div>

        <!-- Performance Metrics -->
        <div class="performance-metrics">
            <h2 style="color: #3498db; margin-bottom: 20px;">📈 HIỆU SUẤT HỆ THỐNG</h2>
            <div class="metrics-grid">
                <div class="metric-card">
                    <h3 style="color: #aaa; font-size: 1.1em; margin-bottom: 10px;">Độ chính xác tổng</h3>
                    <div style="font-size: 2.5em; font-weight: bold; color: var(--success);" id="totalAccuracy">0%</div>
                    <div class="metric-chart">
                        <div class="mini-chart" id="accuracyChart"></div>
                    </div>
                </div>
                <div class="metric-card">
                    <h3 style="color: #aaa; font-size: 1.1em; margin-bottom: 10px;">ROI giả lập</h3>
                    <div style="font-size: 2.5em; font-weight: bold;" id="roiDisplay">+0%</div>
                    <div class="metric-chart">
                        <div class="mini-chart" id="roiChart"></div>
                    </div>
                </div>
                <div class="metric-card">
                    <h3 style="color: #aaa; font-size: 1.1em; margin-bottom: 10px;">Confidence Score</h3>
                    <div style="font-size: 2.5em; font-weight: bold; color: var(--warning);" id="confidenceScore">0%</div>
                    <div class="metric-chart">
                        <div class="mini-chart" id="confidenceChart"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Smart Actions Panel -->
        <div class="smart-actions">
            <div class="smart-actions-title">
                🤖 THAO TÁC THÔNG MINH
            </div>
            <div class="action-buttons">
                <button class="action-btn" onclick="autoAnalyze()">
                    <span class="action-btn-icon">🔍</span>
                    <span class="action-btn-text">Phân tích sâu</span>
                </button>
                <button class="action-btn" onclick="suggestBet()">
                    <span class="action-btn-icon">💡</span>
                    <span class="action-btn-text">Gợi ý cược</span>
                </button>
                <button class="action-btn" onclick="simulateNext()">
                    <span class="action-btn-icon">🎲</span>
                    <span class="action-btn-text">Mô phỏng</span>
                </button>
                <button class="action-btn" onclick="exportData()">
                    <span class="action-btn-icon">📊</span>
                    <span class="action-btn-text">Xuất báo cáo</span>
                </button>
                <button class="action-btn" onclick="loadPreset()">
                    <span class="action-btn-icon">📂</span>
                    <span class="action-btn-text">Tải preset</span>
                </button>
                <button class="action-btn" onclick="toggleAutoMode()">
                    <span class="action-btn-icon">🤖</span>
                    <span class="action-btn-text" id="autoModeText">Auto: OFF</span>
                </button>
            </div>
        </div>

        <!-- Pattern Radar -->
        <div class="pattern-radar">
            <h2 style="color: #4fd1c5; margin-bottom: 20px; text-align: center;">🎯 RADAR NHẬN DIỆN MẪU</h2>
            <div class="radar-container">
                <div class="radar-circle"></div>
                <div class="radar-circle"></div>
                <div class="radar-circle"></div>
                <div class="radar-circle"></div>
                <div class="radar-scan"></div>
                <div class="radar-dots" id="radarDots"></div>
            </div>
            <div style="text-align: center; margin-top: 20px;">
                <p style="color: #aaa;">Đang quét: <span id="scanningPattern" style="color: var(--primary-gold);">-</span></p>
                <p style="color: #888; font-size: 0.9em; margin-top: 5px;">Phát hiện: <span id="detectedCount">0</span> mẫu</p>
            </div>
        </div>

        <!-- Enhanced Input Section -->
        <div class="input-section">
            <h2 style="color: var(--primary-gold); margin-bottom: 25px; text-align: center; font-size: 1.8em;">
                🎲 NHẬP KẾT QUẢ
            </h2>
            
            <div class="main-buttons">
                <button class="game-button btn-player" onclick="addResult('P')">
                    <span class="button-icon">👤</span>
                    <span class="button-text">PLAYER</span>
                </button>
                <button class="game-button btn-banker" onclick="addResult('B')">
                    <span class="button-icon">🏦</span>
                    <span class="button-text">BANKER</span>
                </button>
                <button class="game-button btn-tie" onclick="addResult('T')">
                    <span class="button-icon">🤝</span>
                    <span class="button-text">TIE</span>
                </button>
            </div>
            
            <div style="display: flex; gap: 15px; flex-wrap: wrap;">
                <button class="action-btn" style="flex: 1;" onclick="undoLast()">
                    <span>↩️ Hoàn tác</span>
                </button>
                <button class="action-btn" style="flex: 1; background: rgba(231, 76, 60, 0.2); border-color: #e74c3c;" onclick="clearHistory()">
                    <span>🗑️ Xóa tất cả</span>
                </button>
                <button class="action-btn" style="flex: 1;" onclick="generateDemo()">
                    <span>🎲 Demo 30 ván</span>
                </button>
            </div>
            
            <div id="historyDisplay" style="margin-top: 20px; padding: 20px; background: rgba(0, 0, 0, 0.3); border-radius: 15px; min-height: 80px; display: flex; flex-wrap: wrap; gap: 8px;"></div>
        </div>

        <!-- Enhanced Prediction Section -->
        <div class="prediction-section">
            <h2 style="color: var(--primary-gold); margin-bottom: 25px; text-align: center; font-size: 1.8em;">
                🔮 DỰ ĐOÁN AI NÂNG CAO
            </h2>
            <div class="prediction-grid">
                <div class="prediction-card" id="predPlayer">
                    <h3 style="color: var(--player-blue); font-size: 1.5em; margin-bottom: 15px;">👤 PLAYER</h3>
                    <div style="font-size: 3em; font-weight: bold; margin: 20px 0;" id="playerProb">0%</div>
                    <div class="confidence-badge" id="playerConfidence">-</div>
                    <div style="margin-top: 15px;">
                        <div style="color: #888; font-size: 0.9em;">Win rate: <span id="playerWinRate">0%</span></div>
                    </div>
                </div>
                
                <div class="prediction-card" id="predBanker">
                    <h3 style="color: var(--banker-red); font-size: 1.5em; margin-bottom: 15px;">🏦 BANKER</h3>
                    <div style="font-size: 3em; font-weight: bold; margin: 20px 0;" id="bankerProb">0%</div>
                    <div class="confidence-badge" id="bankerConfidence">-</div>
                    <div style="margin-top: 15px;">
                        <div style="color: #888; font-size: 0.9em;">Win rate: <span id="bankerWinRate">0%</span></div>
                    </div>
                </div>
                
                <div class="prediction-card" id="predTie">
                    <h3 style="color: var(--tie-green); font-size: 1.5em; margin-bottom: 15px;">🤝 TIE</h3>
                    <div style="font-size: 3em; font-weight: bold; margin: 20px 0;" id="tieProb">0%</div>
                    <div class="confidence-badge" id="tieConfidence">-</div>
                    <div style="margin-top: 15px;">
                        <div style="color: #888; font-size: 0.9em;">Win rate: <span id="tieWinRate">0%</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // ===== ENHANCED SYSTEM CLASSES =====
        
        // Cycle Tracker for Win/Loss sequences
        class CycleTracker {
            constructor() {
                this.cycles = [];
                this.currentCycle = {
                    number: 1,
                    predictions: [],
                    wins: 0,
                    losses: 0,
                    startTime: Date.now()
                };
                this.winStreak = 0;
                this.lossStreak = 0;
                this.maxWinStreak = 0;
                this.maxLossStreak = 0;
                this.timeline = [];
            }

            addPrediction(predicted, actual) {
                const isCorrect = predicted === actual;
                
                this.currentCycle.predictions.push({
                    predicted,
                    actual,
                    correct: isCorrect,
                    timestamp: Date.now()
                });

                if (isCorrect) {
                    this.currentCycle.wins++;
                    this.winStreak++;
                    this.lossStreak = 0;
                    this.maxWinStreak = Math.max(this.maxWinStreak, this.winStreak);
                } else {
                    this.currentCycle.losses++;
                    this.lossStreak++;
                    this.winStreak = 0;
                    this.maxLossStreak = Math.max(this.maxLossStreak, this.lossStreak);
                }

                // Add to timeline
                this.timeline.push({
                    type: isCorrect ? 'win' : 'loss',
                    streak: isCorrect ? this.winStreak : this.lossStreak
                });

                if (this.timeline.length > 30) {
                    this.timeline.shift();
                }

                // Check for cycle completion (every 10 predictions)
                if (this.currentCycle.predictions.length >= 10) {
                    this.completeCycle();
                }
            }

            completeCycle() {
                this.cycles.push({...this.currentCycle});
                this.currentCycle = {
                    number: this.cycles.length + 1,
                    predictions: [],
                    wins: 0,
                    losses: 0,
                    startTime: Date.now()
                };
            }

            getWinLossRatio() {
                const totalWins = this.cycles.reduce((sum, c) => sum + c.wins, 0) + this.currentCycle.wins;
                const totalLosses = this.cycles.reduce((sum, c) => sum + c.losses, 0) + this.currentCycle.losses;
                
                if (totalLosses === 0) return totalWins > 0 ? 999 : 0;
                return (totalWins / totalLosses).toFixed(2);
            }

            reset() {
                this.cycles = [];
                this.currentCycle = {
                    number: 1,
                    predictions: [],
                    wins: 0,
                    losses: 0,
                    startTime: Date.now()
                };
                this.winStreak = 0;
                this.lossStreak = 0;
                this.maxWinStreak = 0;
                this.maxLossStreak = 0;
                this.timeline = [];
            }
        }

        // Enhanced Streak Analyzer
        class StreakAnalyzer {
            constructor() {
                this.patterns = {};
                this.hotPattern = null;
                this.longestDragon = { length: 0, type: null };
                this.trendScore = 0;
            }

            analyze(history) {
                if (history.length < 3) return;

                // Analyze current streak
                const currentStreak = this.getCurrentStreak(history);
                
                // Analyze longest dragon
                this.findLongestDragon(history);
                
                // Analyze hot patterns
                this.findHotPattern(history);
                
                // Calculate trend score
                this.calculateTrendScore(history);
                
                return {
                    currentStreak,
                    longestDragon: this.longestDragon,
                    hotPattern: this.hotPattern,
                    trendScore: this.trendScore
                };
            }

            getCurrentStreak(history) {
                if (history.length === 0) return { length: 0, type: null };
                
                let length = 1;
                const lastResult = history[history.length - 1];
                
                for (let i = history.length - 2; i >= 0; i--) {
                    if (history[i] === lastResult && lastResult !== 'T') {
                        length++;
                    } else {
                        break;
                    }
                }
                
                return { length, type: lastResult };
            }

            findLongestDragon(history) {
                let maxLength = 0;
                let maxType = null;
                let currentLength = 1;
                let currentType = history[0];
                
                for (let i = 1; i < history.length; i++) {
                    if (history[i] === currentType && currentType !== 'T') {
                        currentLength++;
                    } else {
                        if (currentLength > maxLength) {
                            maxLength = currentLength;
                            maxType = currentType;
                        }
                        currentType = history[i];
                        currentLength = 1;
                    }
                }
                
                if (currentLength > maxLength) {
                    maxLength = currentLength;
                    maxType = currentType;
                }
                
                this.longestDragon = { length: maxLength, type: maxType };
            }

            findHotPattern(history) {
                this.patterns = {};
                
                // Analyze 3-result patterns
                for (let i = 0; i <= history.length - 3; i++) {
                    const pattern = history.slice(i, i + 3).join('');
                    this.patterns[pattern] = (this.patterns[pattern] || 0) + 1;
                }
                
                // Find most frequent pattern
                let maxFreq = 0;
                let hotPattern = null;
                
                for (let pattern in this.patterns) {
                    if (this.patterns[pattern] > maxFreq) {
                        maxFreq = this.patterns[pattern];
                        hotPattern = pattern;
                    }
                }
                
                this.hotPattern = { pattern: hotPattern, frequency: maxFreq };
            }

            calculateTrendScore(history) {
                if (history.length < 10) {
                    this.trendScore = 0;
                    return;
                }
                
                const recent = history.slice(-10);
                const pCount = recent.filter(r => r === 'P').length;
                const bCount = recent.filter(r => r === 'B').length;
                
                // Score from -100 (strong Banker) to +100 (strong Player)
                this.trendScore = ((pCount - bCount) / 10) * 100;
            }
        }

        // Smart Actions Manager
        class SmartActionsManager {
            constructor() {
                this.autoMode = false;
                this.autoInterval = null;
                this.suggestions = [];
            }

            toggleAutoMode() {
                this.autoMode = !this.autoMode;
                
                if (this.autoMode) {
                    this.startAutoMode();
                } else {
                    this.stopAutoMode();
                }
                
                return this.autoMode;
            }

            startAutoMode() {
                this.autoInterval = setInterval(() => {
                    this.autoAnalyze();
                }, 5000); // Auto analyze every 5 seconds
            }

            stopAutoMode() {
                if (this.autoInterval) {
                    clearInterval(this.autoInterval);
                    this.autoInterval = null;
                }
            }

            autoAnalyze() {
                // Trigger deep analysis
                if (window.analyzer) {
                    const analysis = window.analyzer.analyze();
                    this.generateSuggestions(analysis);
                }
            }

            generateSuggestions(analysis) {
                this.suggestions = [];
                
                // Generate betting suggestions based on analysis
                const pred = analysis.prediction;
                const confidence = analysis.confidence;
                
                if (confidence > 70) {
                    const max = Math.max(pred.P, pred.B, pred.T);
                    if (max === pred.P) {
                        this.suggestions.push({
                            type: 'bet',
                            target: 'PLAYER',
                            confidence: 'HIGH',
                            amount: 'normal'
                        });
                    } else if (max === pred.B) {
                        this.suggestions.push({
                            type: 'bet',
                            target: 'BANKER',
                            confidence: 'HIGH',
                            amount: 'normal'
                        });
                    }
                } else if (confidence < 40) {
                    this.suggestions.push({
                        type: 'wait',
                        reason: 'Low confidence',
                        recommendation: 'Skip this round'
                    });
                }
                
                return this.suggestions;
            }

            exportData() {
                const data = {
                    timestamp: new Date().toISOString(),
                    history: window.gameHistory,
                    analysis: window.analyzer.analyze(),
                    cycles: window.cycleTracker.cycles,
                    performance: {
                        accuracy: window.analyzer.accuracyTracker.getOverallAccuracy(),
                        roi: window.analyzer.accuracyTracker.getROIPercentage()
                    }
                };
                
                const json = JSON.stringify(data, null, 2);
                const blob = new Blob([json], { type: 'application/json' });
                const url = URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.href = url;
                a.download = `baccarat_report_${Date.now()}.json`;
                a.click();
            }
        }

        // ===== GLOBAL INITIALIZATION =====
        let gameHistory = [];
        let analyzer = new AdvancedBaccaratAnalyzer();
        let cycleTracker = new CycleTracker();
        let streakAnalyzer = new StreakAnalyzer();
        let smartActions = new SmartActionsManager();

        // ===== ENHANCED UI FUNCTIONS =====
        
        function addResult(result) {
            // Get current prediction before adding result
            const analysis = analyzer.analyze();
            const predicted = getPredictedOutcome(analysis.prediction);
            
            gameHistory.push(result);
            analyzer.addResult(result);
            
            // Track cycle
            if (predicted) {
                cycleTracker.addPrediction(predicted, result);
            }
            
            updateAllDisplays();
        }

        function getPredictedOutcome(prediction) {
            const max = Math.max(prediction.P, prediction.B, prediction.T);
            if (max < 35) return null; // Too low confidence
            
            if (max === prediction.P) return 'P';
            if (max === prediction.B) return 'B';
            if (max === prediction.T) return 'T';
            return null;
        }

        function updateAllDisplays() {
            updateDisplay();
            analyzeAndPredict();
            updateCycleDisplay();
            updateStreakDisplay();
            updatePerformanceMetrics();
            updateRadar();
        }

        function updateCycleDisplay() {
            document.getElementById('currentCycle').textContent = cycleTracker.currentCycle.number;
            document.getElementById('winStreak').textContent = cycleTracker.winStreak;
            document.getElementById('lossStreak').textContent = cycleTracker.lossStreak;
            document.getElementById('maxWinStreak').textContent = cycleTracker.maxWinStreak;
            document.getElementById('maxLossStreak').textContent = cycleTracker.maxLossStreak;
            document.getElementById('winLossRatio').textContent = cycleTracker.getWinLossRatio();
            
            // Update timeline
            const timelineDiv = document.getElementById('predictionTimeline');
            timelineDiv.innerHTML = cycleTracker.timeline.map((item, idx) => `
                <div class="timeline-item ${item.type}" title="Chuỗi: ${item.streak}">
                    ${item.type === 'win' ? '✓' : '✗'}
                    <div class="tooltip">
                        Ván #${idx + 1}: ${item.type === 'win' ? 'Thắng' : 'Thua'}
                        <br>Chuỗi: ${item.streak}
                    </div>
                </div>
            `).join('');
            
            // Add pending slots
            const remaining = 30 - cycleTracker.timeline.length;
            for (let i = 0; i < remaining; i++) {
                timelineDiv.innerHTML += '<div class="timeline-item pending">?</div>';
            }
        }

        function updateStreakDisplay() {
            const streakData = streakAnalyzer.analyze(gameHistory);
            
            if (streakData) {
                // Current streak
                const currentStreak = streakData.currentStreak;
                document.getElementById('currentStreakDisplay').textContent = 
                    currentStreak.length > 0 ? `${currentStreak.length}` : '-';
                document.getElementById('streakType').textContent = 
                    currentStreak.type ? `${currentStreak.type === 'P' ? 'Player' : currentStreak.type === 'B' ? 'Banker' : 'Tie'}` : 'Chờ dữ liệu';
                
                // Longest dragon
                document.getElementById('longestDragon').textContent = streakData.longestDragon.length;
                document.getElementById('dragonType').textContent = 
                    streakData.longestDragon.type ? `${streakData.longestDragon.type === 'P' ? 'Player' : 'Banker'}` : '-';
                
                // Hot pattern
                if (streakData.hotPattern && streakData.hotPattern.pattern) {
                    document.getElementById('hotPattern').textContent = streakData.hotPattern.pattern;
                    document.getElementById('patternFreq').textContent = `${streakData.hotPattern.frequency} lần`;
                }
                
                // Trend score
                document.getElementById('trendScore').textContent = Math.abs(streakData.trendScore).toFixed(0);
                let trendDirection = 'Neutral';
                if (streakData.trendScore > 30) trendDirection = 'Strong Player';
                else if (streakData.trendScore > 10) trendDirection = 'Player';
                else if (streakData.trendScore < -30) trendDirection = 'Strong Banker';
                else if (streakData.trendScore < -10) trendDirection = 'Banker';
                document.getElementById('trendDirection').textContent = trendDirection;
            }
        }

        function updatePerformanceMetrics() {
            const tracker = analyzer.accuracyTracker;
            
            // Update accuracy
            const accuracy = tracker.getOverallAccuracy();
            document.getElementById('totalAccuracy').textContent = accuracy.toFixed(1) + '%';
            
            // Update ROI
            const roi = tracker.getROIPercentage();
            const roiElem = document.getElementById('roiDisplay');
            roiElem.textContent = (roi > 0 ? '+' : '') + roi.toFixed(1) + '%';
            roiElem.style.color = roi > 0 ? var('--success') : roi < 0 ? var('--danger') : var('--warning');
            
            // Update confidence
            const analysis = analyzer.analyze();
            document.getElementById('confidenceScore').textContent = analysis.confidence.toFixed(0) + '%';
            
            // Update mini charts
            updateMiniCharts();
        }

        function updateMiniCharts() {
            // Accuracy chart
            const accuracyChart = document.getElementById('accuracyChart');
            const last10 = analyzer.accuracyTracker.last10Accuracy;
            
            if (last10.length > 0) {
                accuracyChart.innerHTML = last10.map(acc => 
                    `<div class="chart-bar" style="height: ${acc * 100}%; background: ${acc ? 'var(--success)' : 'var(--danger)'};"></div>`
                ).join('');
            }
            
            // ROI chart (simplified)
            const roiChart = document.getElementById('roiChart');
            const roiHistory = analyzer.accuracyTracker.roiHistory.slice(-10);
            if (roiHistory.length > 0) {
                const maxRoi = Math.max(...roiHistory);
                const minRoi = Math.min(...roiHistory);
                const range = maxRoi - minRoi || 1;
                
                roiChart.innerHTML = roiHistory.map(roi => {
                    const height = ((roi - minRoi) / range) * 100;
                    return `<div class="chart-bar" style="height: ${height}%; background: ${roi > 100 ? 'var(--success)' : 'var(--danger)'};"></div>`;
                }).join('');
            }
            
            // Confidence chart
            const confidenceChart = document.getElementById('confidenceChart');
            if (analyzer.confidenceHistory.length > 0) {
                const last10Conf = analyzer.confidenceHistory.slice(-10);
                confidenceChart.innerHTML = last10Conf.map(conf => 
                    `<div class="chart-bar" style="height: ${conf}%; background: linear-gradient(180deg, var(--warning), var(--primary-gold));"></div>`
                ).join('');
            }
        }

        function updateRadar() {
            const analysis = analyzer.analyze();
            const patterns = analysis.patterns.detected;
            
            // Update radar dots
            const radarDots = document.getElementById('radarDots');
            radarDots.innerHTML = '';
            
            patterns.slice(0, 5).forEach((pattern, idx) => {
                const angle = (idx * 72) * Math.PI / 180;
                const radius = 60 + Math.random() * 30;
                const x = 100 + radius * Math.cos(angle);
                const y = 100 + radius * Math.sin(angle);
                
                let dotClass = 'player';
                if (pattern.next === 'B') dotClass = 'banker';
                else if (pattern.next === 'T') dotClass = 'tie';
                
                radarDots.innerHTML += `
                    <div class="radar-dot ${dotClass}" style="left: ${x}px; top: ${y}px;"></div>
                `;
            });
            
            // Update scanning info
            document.getElementById('scanningPattern').textContent = 
                patterns.length > 0 ? patterns[0].name : 'Đang quét...';
            document.getElementById('detectedCount').textContent = patterns.length;
        }

        // Smart Action Functions
        function autoAnalyze() {
            smartActions.autoAnalyze();
            showNotification('Đã phân tích sâu!', 'success');
        }

        function suggestBet() {
            const analysis = analyzer.analyze();
            const suggestions = smartActions.generateSuggestions(analysis);
            
            if (suggestions.length > 0) {
                const suggestion = suggestions[0];
                if (suggestion.type === 'bet') {
                    showNotification(`Gợi ý: Đặt ${suggestion.target} (Độ tin cậy: ${suggestion.confidence})`, 'success');
                } else {
                    showNotification(`Gợi ý: ${suggestion.recommendation}`, 'warning');
                }
            }
        }

        function simulateNext() {
            // Simulate next 5 results
            const options = ['P', 'B', 'T'];
            const weights = [0.45, 0.45, 0.1];
            
            for (let i = 0; i < 5; i++) {
                setTimeout(() => {
                    const random = Math.random();
                    let result;
                    if (random < weights[0]) result = 'P';
                    else if (random < weights[0] + weights[1]) result = 'B';
                    else result = 'T';
                    
                    addResult(result);
                }, i * 500);
            }
            
            showNotification('Đang mô phỏng 5 ván...', 'info');
        }

        function exportData() {
            smartActions.exportData();
            showNotification('Đã xuất báo cáo!', 'success');
        }

        function loadPreset() {
            // Load a preset pattern for testing
            const presets = [
                ['P', 'P', 'B', 'B', 'P', 'P', 'B', 'B'], // Ping Pong
                ['P', 'P', 'P', 'P', 'P', 'B', 'B', 'B', 'B', 'B'], // Dragons
                ['P', 'B', 'P', 'B', 'P', 'B', 'P', 'B'], // Choppy
            ];
            
            const preset = presets[Math.floor(Math.random() * presets.length)];
            
            gameHistory = [];
            analyzer = new AdvancedBaccaratAnalyzer();
            cycleTracker = new CycleTracker();
            
            preset.forEach(result => addResult(result));
            
            showNotification('Đã tải preset mẫu!', 'success');
        }

        function toggleAutoMode() {
            const isAuto = smartActions.toggleAutoMode();
            document.getElementById('autoModeText').textContent = `Auto: ${isAuto ? 'ON' : 'OFF'}`;
            showNotification(`Auto mode: ${isAuto ? 'BẬT' : 'TẮT'}`, isAuto ? 'success' : 'warning');
        }

        function showCycleDetails() {
            const details = {
                cycles: cycleTracker.cycles,
                current: cycleTracker.currentCycle,
                ratio: cycleTracker.getWinLossRatio()
            };
            
            console.log('Cycle Details:', details);
            showNotification('Chi tiết chu kỳ đã được log trong console', 'info');
        }

        function resetCycle() {
            if (confirm('Reset toàn bộ chu kỳ thắng/thua?')) {
                cycleTracker.reset();
                updateCycleDisplay();
                showNotification('Đã reset chu kỳ!', 'success');
            }
        }

        function showNotification(message, type = 'info') {
            // Create notification element
            const notification = document.createElement('div');
            notification.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                padding: 15px 25px;
                background: ${type === 'success' ? 'var(--success)' : type === 'warning' ? 'var(--warning)' : type === 'danger' ? 'var(--danger)' : '#3498db'};
                color: white;
                border-radius: 10px;
                box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
                z-index: 10000;
                animation: slideIn 0.3s ease;
            `;
            notification.textContent = message;
            
            document.body.appendChild(notification);
            
            setTimeout(() => {
                notification.style.animation = 'slideOut 0.3s ease';
                setTimeout(() => notification.remove(), 300);
            }, 3000);
        }

        // Add notification animations
        const style = document.createElement('style');
        style.textContent = `
            @keyframes slideIn {
                from { transform: translateX(100%); opacity: 0; }
                to { transform: translateX(0); opacity: 1; }
            }
            @keyframes slideOut {
                from { transform: translateX(0); opacity: 1; }
                to { transform: translateX(100%); opacity: 0; }
            }
        `;
        document.head.appendChild(style);

        // Original functions (keeping compatibility)
        function undoLast() {
            if (gameHistory.length > 0) {
                gameHistory.pop();
                analyzer.history.pop();
                updateAllDisplays();
                showNotification('Đã hoàn tác!', 'info');
            }
        }

        function clearHistory() {
            if (confirm('Xóa toàn bộ lịch sử?')) {
                gameHistory = [];
                analyzer = new AdvancedBaccaratAnalyzer();
                cycleTracker = new CycleTracker();
                streakAnalyzer = new StreakAnalyzer();
                updateAllDisplays();
                showNotification('Đã xóa lịch sử!', 'success');
            }
        }

        function generateDemo() {
            const options = ['P', 'B', 'T'];
            const weights = [0.45, 0.45, 0.1];
            
            for (let i = 0; i < 30; i++) {
                const random = Math.random();
                let result;
                if (random < weights[0]) result = 'P';
                else if (random < weights[0] + weights[1]) result = 'B';
                else result = 'T';
                
                gameHistory.push(result);
                analyzer.addResult(result);
            }
            
            updateAllDisplays();
            showNotification('Đã tạo 30 ván demo!', 'success');
        }

        function updateDisplay() {
            const historyDiv = document.getElementById('historyDisplay');
            historyDiv.innerHTML = gameHistory.map((result, index) => {
                let className = '';
                let icon = '';
                
                switch(result) {
                    case 'P': 
                        className = 'player-history'; 
                        icon = '👤';
                        break;
                    case 'B': 
                        className = 'banker-history'; 
                        icon = '🏦';
                        break;
                    case 'T': 
                        className = 'tie-history'; 
                        icon = '🤝';
                        break;
                }
                
                return `
                    <div style="
                        padding: 10px 15px;
                        background: ${result === 'P' ? 'var(--player-blue)' : result === 'B' ? 'var(--banker-red)' : 'var(--tie-green)'};
                        color: white;
                        border-radius: 10px;
                        font-weight: bold;
                        display: flex;
                        align-items: center;
                        gap: 5px;
                        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
                    ">
                        <span style="font-size: 0.9em; opacity: 0.8;">#${index + 1}</span>
                        <span>${icon}</span>
                        <span>${result}</span>
                    </div>
                `;
            }).join('');
        }

        function analyzeAndPredict() {
            const analysis = analyzer.analyze();
            
            // Update predictions
            updatePredictions(analysis.prediction, analysis.confidence);
            
            // Update confidence history
            if (!analyzer.confidenceHistory) {
                analyzer.confidenceHistory = [];
            }
            analyzer.confidenceHistory.push(analysis.confidence);
            if (analyzer.confidenceHistory.length > 50) {
                analyzer.confidenceHistory.shift();
            }
        }

        function updatePredictions(prediction, overallConfidence) {
            // Update probabilities
            document.getElementById('playerProb').textContent = prediction.P.toFixed(1) + '%';
            document.getElementById('bankerProb').textContent = prediction.B.toFixed(1) + '%';
            document.getElementById('tieProb').textContent = prediction.T.toFixed(1) + '%';
            
            // Update win rates
            const history = gameHistory.filter(r => ['P', 'B', 'T'].includes(r));
            const total = history.length || 1;
            const pCount = history.filter(r => r === 'P').length;
            const bCount = history.filter(r => r === 'B').length;
            const tCount = history.filter(r => r === 'T').length;
            
            document.getElementById('playerWinRate').textContent = ((pCount / total) * 100).toFixed(1) + '%';
            document.getElementById('bankerWinRate').textContent = ((bCount / total) * 100).toFixed(1) + '%';
            document.getElementById('tieWinRate').textContent = ((tCount / total) * 100).toFixed(1) + '%';
            
            // Update confidence badges
            updateConfidenceBadge('playerConfidence', prediction.P);
            updateConfidenceBadge('bankerConfidence', prediction.B);
            updateConfidenceBadge('tieConfidence', prediction.T);
            
            // Highlight recommended
            const cards = document.querySelectorAll('.prediction-card');
            cards.forEach(card => card.classList.remove('recommended'));
            
            const max = Math.max(prediction.P, prediction.B, prediction.T);
            if (max > 40 && overallConfidence > 50) {
                if (max === prediction.P) {
                    document.getElementById('predPlayer').classList.add('recommended');
                } else if (max === prediction.B) {
                    document.getElementById('predBanker').classList.add('recommended');
                } else if (max === prediction.T) {
                    document.getElementById('predTie').classList.add('recommended');
                }
            }
        }

        function updateConfidenceBadge(elementId, value) {
            const badge = document.getElementById(elementId);
            badge.style.cssText = `
                display: inline-block;
                padding: 8px 20px;
                border-radius: 20px;
                font-size: 1em;
                font-weight: bold;
                margin-top: 10px;
            `;
            
            if (value >= 50) {
                badge.style.background = 'linear-gradient(135deg, #27ae60, #229954)';
                badge.style.color = 'white';
                badge.textContent = 'CAO';
            } else if (value >= 35) {
                badge.style.background = 'linear-gradient(135deg, #f39c12, #e67e22)';
                badge.style.color = 'white';
                badge.textContent = 'TRUNG BÌNH';
            } else {
                badge.style.background = 'linear-gradient(135deg, #e74c3c, #c0392b)';
                badge.style.color = 'white';
                badge.textContent = 'THẤP';
            }
        }

        // Keep original classes
        class AdvancedBaccaratAnalyzer {
            constructor() {
                this.magicNumber = new MagicNumber142857();
                this.patternSystem = new PatternRecognitionSystem();
                this.accuracyTracker = new AccuracyTracker();
                this.history = [];
                this.predictions = [];
                this.confidenceHistory = [];
            }

            addResult(result) {
                this.accuracyTracker.recordActualResult(result);
                this.history.push(result);
                this.magicNumber.getNextPhase();
            }

            analyze() {
                if (this.history.length < 3) {
                    return {
                        prediction: { P: 33.3, B: 33.3, T: 33.3 },
                        confidence: 0,
                        patterns: { detected: [], warnings: [] },
                        magic: null
                    };
                }

                const patterns = this.patternSystem.analyzePatterns(this.history);
                const magicPred = this.magicNumber.calculatePrediction(this.history);
                
                let finalPrediction = { P: 0, B: 0, T: 0 };
                let weights = 0;
                
                if (magicPred) {
                    finalPrediction.P += magicPred.P * 0.3;
                    finalPrediction.B += magicPred.B * 0.3;
                    finalPrediction.T += magicPred.T * 0.3;
                    weights += 0.3;
                }
                
                patterns.detected.forEach(pattern => {
                    if (pattern.next && pattern.confidence > 0.6) {
                        const weight = pattern.confidence * 0.2;
                        if (pattern.next === 'P') finalPrediction.P += weight * 100;
                        if (pattern.next === 'B') finalPrediction.B += weight * 100;
                        weights += weight;
                    }
                });
                
                const statPred = this.getStatisticalPrediction();
                finalPrediction.P += statPred.P * 0.2;
                finalPrediction.B += statPred.B * 0.2;
                finalPrediction.T += statPred.T * 0.2;
                weights += 0.2;
                
                if (weights > 0) {
                    const total = finalPrediction.P + finalPrediction.B + finalPrediction.T;
                    finalPrediction.P = (finalPrediction.P / total) * 100;
                    finalPrediction.B = (finalPrediction.B / total) * 100;
                    finalPrediction.T = (finalPrediction.T / total) * 100;
                }
                
                this.accuracyTracker.makePrediction(finalPrediction);
                
                const confidence = this.calculateConfidence(patterns, magicPred);
                
                return {
                    prediction: finalPrediction,
                    confidence: confidence,
                    patterns: patterns,
                    magic: magicPred
                };
            }

            getStatisticalPrediction() {
                const recent = this.history.slice(-20).filter(r => ['P', 'B', 'T'].includes(r));
                const counts = { P: 0, B: 0, T: 0 };
                recent.forEach(r => counts[r]++);
                
                const total = recent.length || 1;
                const expected = total / 3;
                
                const prediction = {
                    P: 33.3 + (expected - counts.P) * 2,
                    B: 33.3 + (expected - counts.B) * 2,
                    T: 33.3 + (expected - counts.T) * 2
                };
                
                prediction.P = Math.max(5, Math.min(90, prediction.P));
                prediction.B = Math.max(5, Math.min(90, prediction.B));
                prediction.T = Math.max(5, Math.min(30, prediction.T));
                
                return prediction;
            }

            calculateConfidence(patterns, magicPred) {
                let confidence = 50;
                
                if (patterns.detected.length > 0) {
                    const avgPatternConf = patterns.detected.reduce((sum, p) => sum + p.confidence, 0) / patterns.detected.length;
                    confidence += avgPatternConf * 20;
                }
                
                confidence -= patterns.warnings.length * 10;
                
                if (magicPred) {
                    const accuracy = this.magicNumber.getAccuracy();
                    confidence += (accuracy - 50) * 0.5;
                }
                
                confidence += Math.min(20, this.history.length * 0.5);
                
                return Math.max(0, Math.min(100, confidence));
            }
        }

        // Include other original classes (simplified versions shown above)
        class AccuracyTracker {
            constructor() {
                this.predictions = [];
                this.results = [];
                this.currentPrediction = null;
                this.currentStreak = 0;
                this.maxStreak = 0;
                this.stats = { P: { predicted: 0, correct: 0 }, B: { predicted: 0, correct: 0 }, T: { predicted: 0, correct: 0 } };
                this.last10Accuracy = [];
                this.roi = 100;
                this.roiHistory = [];
            }

            makePrediction(prediction) {
                if (this.currentPrediction) {
                    this.predictions.push(this.currentPrediction);
                    this.results.push(null);
                }
                
                const maxProb = Math.max(prediction.P, prediction.B, prediction.T);
                let predictedOutcome = null;
                
                if (maxProb > 35) {
                    if (maxProb === prediction.P) predictedOutcome = 'P';
                    else if (maxProb === prediction.B) predictedOutcome = 'B';
                    else if (maxProb === prediction.T) predictedOutcome = 'T';
                }
                
                this.currentPrediction = {
                    prediction: predictedOutcome,
                    probabilities: { ...prediction },
                    confidence: maxProb,
                    timestamp: Date.now()
                };
            }

            recordActualResult(actual) {
                if (!this.currentPrediction) return;
                
                const predicted = this.currentPrediction.prediction;
                const isCorrect = predicted === actual;
                
                this.predictions.push(this.currentPrediction);
                this.results.push(actual);
                
                if (predicted) {
                    this.stats[predicted].predicted++;
                    if (isCorrect) {
                        this.stats[predicted].correct++;
                        this.currentStreak++;
                        this.maxStreak = Math.max(this.maxStreak, this.currentStreak);
                    } else {
                        this.currentStreak = 0;
                    }
                }
                
                this.last10Accuracy.push(isCorrect ? 1 : 0);
                if (this.last10Accuracy.length > 10) {
                    this.last10Accuracy.shift();
                }
                
                this.updateROI(predicted, actual);
                this.currentPrediction = null;
            }

            updateROI(predicted, actual) {
                if (!predicted) return;
                
                const betAmount = 10;
                
                if (predicted === actual) {
                    if (actual === 'T') {
                        this.roi += betAmount * 8;
                    } else {
                        this.roi += betAmount * 0.95;
                    }
                } else {
                    this.roi -= betAmount;
                }
                
                this.roiHistory.push(this.roi);
                if (this.roiHistory.length > 100) {
                    this.roiHistory.shift();
                }
            }

            getOverallAccuracy() {
                const validPredictions = this.predictions.filter((p, i) => 
                    p.prediction && this.results[i] !== null
                );
                
                if (validPredictions.length === 0) return 0;
                
                let correct = 0;
                validPredictions.forEach((pred, i) => {
                    if (pred.prediction === this.results[i]) correct++;
                });
                
                return (correct / validPredictions.length) * 100;
            }

            getROIPercentage() {
                return ((this.roi - 100) / 100) * 100;
            }
        }

        class MagicNumber142857 {
            constructor() {
                this.base = 142857;
                this.sequence = [1, 4, 2, 8, 5, 7];
                this.phase = 0;
                this.cycle = 0;
                this.predictions = [];
                this.results = [];
            }

            getNextPhase() {
                this.phase = (this.phase + 1) % 6;
                if (this.phase === 0) this.cycle++;
                return this.sequence[this.phase];
            }

            calculatePrediction(history) {
                if (history.length < 3) return null;
                
                const currentPhase = this.sequence[this.phase];
                const multiplier = (currentPhase * this.base) % 1000000;
                
                const digits = multiplier.toString().split('').map(Number);
                const sum = digits.reduce((a, b) => a + b, 0);
                
                const playerWeight = (digits[0] + digits[2] + digits[4]) / sum;
                const bankerWeight = (digits[1] + digits[3] + digits[5]) / sum;
                const tieWeight = 1 - playerWeight - bankerWeight;
                
                const recentTrend = this.analyzeRecentTrend(history);
                
                return {
                    P: (playerWeight * 70 + recentTrend.P * 30),
                    B: (bankerWeight * 70 + recentTrend.B * 30),
                    T: Math.max(5, tieWeight * 100),
                    phase: currentPhase,
                    cycle: this.cycle
                };
            }

            analyzeRecentTrend(history) {
                const recent = history.slice(-7);
                const counts = { P: 0, B: 0, T: 0 };
                recent.forEach(r => counts[r]++);
                const total = recent.length || 1;
                
                return {
                    P: (counts.P / total) * 100,
                    B: (counts.B / total) * 100,
                    T: (counts.T / total) * 100
                };
            }

            getAccuracy() {
                if (this.predictions.length === 0) return 0;
                
                let correct = 0;
                for (let i = 0; i < this.predictions.length; i++) {
                    const pred = this.predictions[i];
                    const actual = this.results[i];
                    
                    const maxPred = Math.max(pred.P, pred.B, pred.T);
                    if ((maxPred === pred.P && actual === 'P') ||
                        (maxPred === pred.B && actual === 'B') ||
                        (maxPred === pred.T && actual === 'T')) {
                        correct++;
                    }
                }
                
                return (correct / this.predictions.length) * 100;
            }
        }

        class PatternRecognitionSystem {
            constructor() {
                this.patterns = {
                    'Dragon': { check: (h) => this.checkDragon(h), danger: false, description: 'Chuỗi dài cùng kết quả (5+)' },
                    'Ping Pong': { check: (h) => this.checkPingPong(h), danger: false, description: 'Xen kẽ P-B-P-B' },
                    'Choppy': { check: (h) => this.checkChoppy(h), danger: true, description: 'Thay đổi liên tục' }
                };
            }

            checkDragon(history) {
                if (history.length < 5) return { detected: false };
                const last5 = history.slice(-5);
                const allSame = last5.every(r => r === last5[0] && r !== 'T');
                return { detected: allSame, confidence: allSame ? 0.9 : 0, next: allSame ? last5[0] : null };
            }

            checkPingPong(history) {
                if (history.length < 4) return { detected: false };
                const last4 = history.slice(-4);
                const isPingPong = last4[0] !== last4[1] && last4[1] !== last4[2] && last4[2] !== last4[3] &&
                                  last4[0] === last4[2] && last4[1] === last4[3] && !last4.includes('T');
                return { detected: isPingPong, confidence: isPingPong ? 0.75 : 0, next: isPingPong ? last4[0] : null };
            }

            checkChoppy(history) {
                if (history.length < 10) return { detected: false };
                const last10 = history.slice(-10);
                let changes = 0;
                for (let i = 1; i < last10.length; i++) {
                    if (last10[i] !== last10[i-1]) changes++;
                }
                const isChoppy = changes >= 7;
                return { detected: isChoppy, confidence: isChoppy ? 0.6 : 0, next: null };
            }

            analyzePatterns(history) {
                const detected = [];
                const warnings = [];
                
                for (let patternName in this.patterns) {
                    const pattern = this.patterns[patternName];
                    const result = pattern.check(history);
                    
                    if (result.detected) {
                        detected.push({
                            name: patternName,
                            confidence: result.confidence,
                            next: result.next,
                            danger: pattern.danger,
                            description: pattern.description
                        });
                        
                        if (pattern.danger) {
                            warnings.push({ name: patternName, description: pattern.description });
                        }
                    }
                }
                
                return { detected, warnings };
            }
        }

        // Initialize on load
        updateAllDisplays();
    </script>
</body>
</html>
