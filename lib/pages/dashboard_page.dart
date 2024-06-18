import 'package:flutter/material.dart';
import '../models/user_data.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _attackPoints = 0;
  int _savedMoney = 0;
  int _consecutiveDays = 0;

  void _recordSmoking(bool didSmoke) {
    setState(() {
      if (didSmoke) {
        _consecutiveDays = 0;
      } else {
        _consecutiveDays++;
        _attackPoints += 20;
        _savedMoney += UserData().pricePerPack; // 1箱あたりの値段を使用
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('禁煙ダッシュボード')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 戦闘シーン
            Container(
              height: 150,
              color: Colors.grey[200],
              child: Center(child: Text('戦闘シーン')),
            ),
            SizedBox(height: 20),
            // 禁煙記録操作
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _recordSmoking(false),
                  child: Text('我慢した'),
                ),
                ElevatedButton(
                  onPressed: () => _recordSmoking(true),
                  child: Text('吸ってしまった'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // 禁煙連続日数
            Text('禁煙連続日数: $_consecutiveDays 日'),
            SizedBox(height: 20),
            // 累計得した金額
            Text('累計得した金額: $_savedMoney 円'),
          ],
        ),
      ),
    );
  }
}
