import './models/category.dart';

final DUMMY_CATEGORIES1 = [
  Category(
    id: 'c1',
    title: 'ARK Innovation ETF',
    subtitle: 'ARKK',
    amount: 17.68,
  ),
  Category(
    id: 'c2',
    title: 'Autonomous Technology ETF',
    subtitle: 'ARKQ',
    amount: 1.70,
  ),
  Category(
    id: 'c3',
    title: 'Next generation Internet ETF',
    subtitle: 'ARKW',
    amount: 5.27,
  ),
  Category(
    id: 'c4',
    title: 'Genomic Revolution ETF',
    subtitle: 'ARKG',
    amount: 7.67,
  ),
  Category(
    id: 'c5',
    title: 'Fintech Innovation ETF',
    subtitle: 'ARKF',
    amount: 1.56,
  ),
];

final DUMMY_CATEGORIES2 = [
  Category(
    id: 'c6',
    title: 'The 3D Printing ETF',
    subtitle: 'PRINT',
    amount: 132,
  ),
  Category(
    id: 'c7',
    title: 'Israel Innovation Technology ETF',
    subtitle: 'IZRL',
    amount: 76,
  ),
];

const FUND_DESCRIPTION = const [
  'ARK defines \"disruptive innovation\" as the introduction of a technologically' +
      'enabled new product or service that potentially changes the way the world works.\n\n' +
      'Companies within ARKK include those that rely on or benefit from the development ' +
      'of new products or services, technological improvements and advancements in ' +
      'scientific research relating to the areas of DNA technologies \(\"Genomic Revolution\"\), ' +
      'industrial innovation in energy, automation and manufacturing \(\"Industrial Innovation\"\), ' +
      'the increased use of shared technology, infrastructure and services \(\"Next Generation Internet\"\), ' +
      'and technologies that make financial services more efficient \(\"Fintech Innovation\"\).\n\n' +
      'ARKK is an actively managed ETF that seeks long-term growth of capital by investing under ' +
      'normal circumstances primarily (at least 65% of its assets) in domestic and ' +
      'foreign equity securities of companies that are relevant to the Fund\'s investment ' +
      'theme of disruptive innovation.'
];

const Dummy_fund_details = const [
  {
    'title': 'Fund Name',
    'detail': 'ARK Innovation ETF',
  },
  {
    'title': 'Ticker',
    'detail': 'ARKK',
  },
  {
    'title': 'Fund Type',
    'detail': 'Active Equity ETF',
  },
  {
    'title': 'CUSIP',
    'detail': '00214Q 104',
  },
  {
    'title': 'ISIN',
    'detail': 'US00214Q1040',
  },
  {
    'title': 'Primary Exchange',
    'detail': 'NYSE Arca',
  },
  {
    'title': 'Inception Date',
    'detail': '10/31/2014',
  },
  {
    'title': 'Net Assets',
    'detail': '\$ 17.68 B',
  },
  {
    'title': 'Expense Ratio',
    'detail': '0.75%',
  },
  {
    'title': 'Indicative Value',
    'detail': 'ARKK.IV',
  },
  {
    'title': 'Net Asset Value(NAV)',
    'detail': 'ARKK.NV',
  },
  {
    'title': 'Typical # of Holdings',
    'detail': '35-55',
  },
  {
    'title': 'Weighted Avg Market CAP',
    'detail': '\$ 122 B',
  },
  {
    'title': 'Median Market CAP',
    'detail': '\$ 11 B',
  },
  {
    'title': 'Portfolio Managers',
    'detail': 'Catherine D. Wood',
  },
];

const Nav_And_Market_Price = const [
  {
    'title': 'Fund Name',
    'detail': 'ARK Innovation ETF',
  },
  {
    'title': 'As of Date',
    'detail': '3/24/2021',
  },
  {
    'title': 'NAV',
    'detail': '\$ 114.84',
  },
  {
    'title': 'NAV Change',
    'detail': '\$-6.91 | -5.67%',
  },
  {
    'title': 'Market Price',
    'detail': '\$ 114.78',
  },
  {
    'title': 'Market Price Change',
    'detail': '\$-6.92 | -5.69%',
  },
  {
    'title': 'Median Bid/Ask Spread(30 day)',
    'detail': '0.03%',
  },
  {
    'title': 'Day\'s Trading Volume',
    'detail': '18,523,895 shares',
  },
];

const Arkk_Performance = const [
  {
    'title': '3 MONTHS',
    'values': ['37.44%', '37.55%']
  },
  {
    'title': 'YTD',
    'values': ['152.51%', '152.83%']
  },
  {
    'title': '1 YEAR*',
    'values': ['152.51%', '152.83%']
  },
  {
    'title': '3 YEARS*',
    'values': ['52.36%', '52.34%']
  },
  {
    'title': '5 YEARS*',
    'values': ['45.40%', '46.03%']
  },
  {
    'title': 'SINCE INCEPTION',
    'values': ['36.39%', '36.42%']
  },
];

const Annualized = [
  'Past performance does not guarantee future results. The performance data quoted' + 
  'represents past performance and current returns may be lower or higher. The ' +
'investment return and principal will fluctuate so that an investor’s shares when ' +
'redeemed may be worth more or less than the original cost. The Fund’s most recent '+
'month-end performance can be found in the fund material section.\n\n Returns for less ' +
'than one year are not annualized. Net asset value (\"NAV\") returns are based on the '+
'dollar value of a single share of the ETF, calculated using the value of the underlying '+
'assets of the ETF minus its liabilities, divided by the number of shares outstanding.' +
'The NAV is typically calculated at 4:00 pm Eastern time on each business day the' +
'New York Stock Exchange is open for trading. Market returns are based on the trade'+ 
'price at which shares are bought and sold on the NYSE Arca, Inc. using the last' +
'share trade. Market performance does not represent the returns you would receive '+
'if you traded shares at other times. Total Return reflects reinvestment of distributions '+
'on ex-date for NAV returns and payment date for Market Price returns. The market '+
'price of the ETF’s shares may differ significantly from their NAV during periods of market volatility.'
];
