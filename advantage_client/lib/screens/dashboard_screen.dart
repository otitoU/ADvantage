/// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import '../core/constants.dart';
import '../widgets/nav_bar.dart';
import '../screens/campaign_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavBar(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopStats(),
              SizedBox(height: 20),
              _buildAdEfficiencyChart(),
              SizedBox(height: 20),
              _buildBottomSections(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopStats() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatCard('Total Ad Spend', '\$56,567.99', '-3.0%', Colors.red,
              'Wed, Jul 20'),
          _buildStatCard('Energy Saved', '1,268 kWh', '+10.0%', Colors.green,
              '143 Orders'),
          _buildStatCard('AI-Optimized ROI', '+27%', '+3.2%', Colors.green,
              '32k Visitors'),
          _buildStatCard('Impressions', '285k', '+8.3%', Colors.green,
              '\$34.28 Average Order'),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String change,
      Color changeColor, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54)),
        SizedBox(height: 4),
        Text(value,
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        SizedBox(height: 2),
        Text(change,
            style: GoogleFonts.poppins(fontSize: 12, color: changeColor)),
        SizedBox(height: 4),
        Text(subtitle,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54)),
      ],
    );
  }

  Widget _buildAdEfficiencyChart() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AI-Driven Ad Efficiency',
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: 'This Month',
                    items: [
                      DropdownMenuItem(
                          value: 'This Month',
                          child: Text('This Month',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold))),
                      DropdownMenuItem(
                          value: 'Last Month', child: Text('Last Month')),
                      DropdownMenuItem(
                          value: 'This Year', child: Text('This Year')),
                    ],
                    onChanged: (value) {},
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 220,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      drawHorizontalLine: true,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                            color: Colors.grey.shade300, strokeWidth: 1);
                      },
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                            color: Colors.grey.shade300, strokeWidth: 1);
                      }),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 20:
                            return Text('20K',
                                style: TextStyle(color: Colors.grey));
                          case 40:
                            return Text('40K',
                                style: TextStyle(color: Colors.grey));
                          case 60:
                            return Text('60K',
                                style: TextStyle(color: Colors.grey));
                          case 80:
                            return Text('80K',
                                style: TextStyle(color: Colors.grey));
                          case 100:
                            return Text('100K',
                                style: TextStyle(color: Colors.grey));
                          default:
                            return Text('');
                        }
                      },
                    )),
                    bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(value.toInt().toString(),
                            style: TextStyle(color: Colors.grey));
                      },
                    )),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(10, 40),
                        FlSpot(11, 60),
                        FlSpot(12, 55),
                        FlSpot(13, 70),
                        FlSpot(14, 65),
                        FlSpot(15, 80),
                        FlSpot(16, 90),
                        FlSpot(17, 50),
                        FlSpot(18, 70),
                        FlSpot(19, 85),
                        FlSpot(20, 75),
                        FlSpot(21, 90),
                        FlSpot(22, 80),
                        FlSpot(23, 85),
                      ],
                      isCurved: true,
                      color: AppColors.primary,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                          show: true,
                          color: AppColors.primary.withOpacity(0.2)),
                      dotData: FlDotData(show: true),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Campaign Performance',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CampaignScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Create New AI Ad',
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.white)),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: () {},
                    child: Text('See All',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: [
                DataColumn(
                    label: Text('Campaign',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                DataColumn(
                    label: Text('Impressions',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                DataColumn(
                    label: Text('Clicks',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                DataColumn(
                    label: Text('CPC',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                DataColumn(
                    label: Text('Spend',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                DataColumn(
                    label: Text('Energy Used',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
                DataColumn(
                    label: Text('AI Score',
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black))),
              ],
              rows: [
                _buildDataRow(Icons.search, 'Google Ads', '189k', '9k',
                    '\$8.12', '\$56,123.12', '200 kWh', '3.5%'),
                _buildDataRow(Icons.tiktok, 'Tik Tok', '287k', '15k', '\$12.12',
                    '\$40,123.12', '180 kWh', '2.8%'),
                _buildDataRow(Icons.camera_alt, 'Instagram', '156k', '12k',
                    '\$5.12', '\$39,123.12', '160 kWh', '4.2%'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataRow _buildDataRow(
      IconData icon,
      campaign,
      String impressions,
      String clicks,
      String cpc,
      String spend,
      String energyUsed,
      String aiScore) {
    return DataRow(cells: [
      DataCell(Row(children: [
        CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey.shade300,
            child: Icon(icon, size: 16, color: Colors.black)),
        SizedBox(width: 10),
        Text(campaign,
            style:
                GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold)),
      ])),
      DataCell(Text(impressions, style: GoogleFonts.poppins(fontSize: 12))),
      DataCell(Text(clicks, style: GoogleFonts.poppins(fontSize: 12))),
      DataCell(Text(cpc, style: GoogleFonts.poppins(fontSize: 12))),
      DataCell(Text(spend, style: GoogleFonts.poppins(fontSize: 12))),
      DataCell(Text(energyUsed, style: GoogleFonts.poppins(fontSize: 12))),
      DataCell(Text(aiScore, style: GoogleFonts.poppins(fontSize: 12))),
    ]);
  }

  Widget _buildBottomSections(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildPerformanceSection(context)),
        SizedBox(width: 20),
        _buildEfficiencyAndFraudSection(),
      ],
    );
  }

  Widget _buildEfficiencyAndFraudSection() {
    return Column(
      children: [
        _buildInfoCard('Energy Efficiency', _buildEnergyEfficiencyContent()),
        SizedBox(height: 20),
        _buildInfoCard('Fraud Detection', _buildFraudDetectionContent()),
      ],
    );
  }

  Widget _buildInfoCard(String title, Widget content) {
    return Container(
      width: 250,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          content,
        ],
      ),
    );
  }

  Widget _buildEnergyEfficiencyContent() {
    return Column(
      children: [
        _buildEfficiencyItem(Icons.smartphone, 'Video Ads', '500 kWh'),
        _buildEfficiencyItem(Icons.computer, 'Image Ads', '200 kWh'),
        _buildEfficiencyItem(Icons.smartphone, 'Text Ads', '100 kWh'),
      ],
    );
  }

  Widget _buildFraudDetectionContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFraudItem('Bot clicks', '4.8%'),
        _buildFraudItem('Ad networks blocked', '3'),
      ],
    );
  }

  Widget _buildEfficiencyItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          SizedBox(width: 10),
          Text(title,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87)),
          Spacer(),
          Text(value,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary)),
        ],
      ),
    );
  }

  Widget _buildFraudItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87)),
          Text(value,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary)),
        ],
      ),
    );
  }
}
