import './models/category.dart';

final Daily_trades1 = [
  Category(
    id: 'd1',
    title: 'ACCOLADE INC',
    subtitle: 'ACCD',
    amount: '2,626',
  ),
  Category(
    id: 'd2',
    title: 'CODEXIS INC',
    subtitle: 'CDXS',
    amount: '44,373',
  ),
  Category(
    id: 'd3',
    title: 'IONIS PHARMACEUTICAL',
    subtitle: 'IONS',
    amount: '46,225',
  ),
];

final Daily_trades2 = [
  Category(
    id: 'd4',
    title: '3D SYSTEMS CORP',
    subtitle: 'DDD',
    amount: '141,254',
  ),
  Category(
    id: 'd5',
    title: 'UNITY SOFTWARE INC',
    subtitle: 'U',
    amount: '187,300',
  ),
  Category(
    id: 'd6',
    title: 'IONIS PHARMACEUTICAL ',
    subtitle: 'IONS',
    amount: '46,225',
  ),
  Category(
    id: 'd7',
    title: 'ONE',
    subtitle: 'AONE',
    amount: '17,570',
  ),
];

const DailyTradeItemList = const [
  {
    'title': 'Direction',
    'detail': 'Buy',
  },
  {
    'title': 'CUSIP',
    'detail': '00437E102',
  },
  {
    'title': 'Shares',
    'detail': '2,626',
  },
  {
    'title': 'Value',
    'detail': '\$2,626.00',
  },
  {
    'title': '% of ETF',
    'detail': '0.0011',
  },
];

final DUMMY_CATEGORIES1 = [
  Category(
    id: 'c1',
    title: 'ARK Innovation ETF',
    subtitle: 'ARKK',
    amount: '17.68 B',
  ),
  Category(
    id: 'c2',
    title: 'Autonomous Technology ETF',
    subtitle: 'ARKQ',
    amount: '1.70 B',
  ),
  Category(
    id: 'c3',
    title: 'Next generation Internet ETF',
    subtitle: 'ARKW',
    amount: '5.27 B',
  ),
  Category(
    id: 'c4',
    title: 'Genomic Revolution ETF',
    subtitle: 'ARKG',
    amount: '7.67 B',
  ),
  Category(
    id: 'c5',
    title: 'Fintech Innovation ETF',
    subtitle: 'ARKF',
    amount: '1.56 B',
  ),
];

final DUMMY_CATEGORIES2 = [
  Category(
    id: 'c6',
    title: 'The 3D Printing ETF',
    subtitle: 'PRINT',
    amount: '132 M',
  ),
  Category(
    id: 'c7',
    title: 'Israel Innovation Technology ETF',
    subtitle: 'IZRL',
    amount: '76 M',
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

const Performance = const [
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

const Annualized = const [
  'Past performance does not guarantee future results. The performance data quoted' +
      'represents past performance and current returns may be lower or higher. The ' +
      'investment return and principal will fluctuate so that an investor’s shares when ' +
      'redeemed may be worth more or less than the original cost. The Fund’s most recent ' +
      'month-end performance can be found in the fund material section.\n\nReturns for less ' +
      'than one year are not annualized. Net asset value (\"NAV\") returns are based on the ' +
      'dollar value of a single share of the ETF, calculated using the value of the underlying ' +
      'assets of the ETF minus its liabilities, divided by the number of shares outstanding.' +
      'The NAV is typically calculated at 4:00 pm Eastern time on each business day the' +
      'New York Stock Exchange is open for trading. Market returns are based on the trade' +
      'price at which shares are bought and sold on the NYSE Arca, Inc. using the last' +
      'share trade. Market performance does not represent the returns you would receive ' +
      'if you traded shares at other times. Total Return reflects reinvestment of distributions ' +
      'on ex-date for NAV returns and payment date for Market Price returns. The market ' +
      'price of the ETF’s shares may differ significantly from their NAV during periods of market volatility.'
];

final HoldingsData = [
  Category(
    id: 'h1',
    title: 'TESLA INC',
    subtitle: 'TSLA',
    amount: '10.90',
  ),
  Category(
    id: 'h2',
    title: 'SQUARE INC - A',
    subtitle: 'SQ',
    amount: '6.17',
  ),
  Category(
    id: 'h3',
    title: 'TELADOC HEALTH INC',
    subtitle: 'TDOC',
    amount: '6.15',
  ),
  Category(
    id: 'h4',
    title: 'ROKU INC',
    subtitle: 'ROKU',
    amount: '5.46',
  ),
  Category(
    id: 'h5',
    title: 'ZILLOW GROUP INC - C',
    subtitle: 'Z',
    amount: '3.64',
  ),
];

const HoldingDataAttributes = const [
  {
    'title': 'Weight',
    'value': '10.90%',
  },
  {
    'title': 'Shares Held',
    'value': '3,675,965',
  },
  {
    'title': 'Market Price',
    'value': '\$640.39',
  },
  {
    'title': 'Market Value',
    'value': '\$2,354,051,226.35',
  },
];

final DataMarket = {
  {
    'date': DateTime.parse('2021-03-15'),
    'market': 128.88,
    'NAV': 128.86,
  },
  {
    'date': DateTime.parse('2021-03-16'),
    'market': 128.08,
    'NAV': 128.02,
  },
  {
    'date': DateTime.parse('2021-03-17'),
    'market': 127.52,
    'NAV': 127.46,
  },
  {
    'date': DateTime.parse('2021-03-18'),
    'market': 120.07,
    'NAV': 120.02,
  },
  {
    'date': DateTime.parse('2021-03-19'),
    'market': 122.36,
    'NAV': 122.36,
  },
  {
    'date': DateTime.parse('2021-03-20'),
    'market': 124.74,
    'NAV': 124.72,
  },
  {
    'date': DateTime.parse('2021-03-21'),
    'market': 121.75,
    'NAV': 121.70,
  },
  {
    'date': DateTime.parse('2021-03-22'),
    'market': 114.84,
    'NAV': 114.78,
  },
  {
    'date': DateTime.parse('2021-03-23'),
    'market': 114.42,
    'NAV': 114.17,
  },
  {
    'date': DateTime.parse('2021-03-24'),
    'market': 113.97,
    'NAV': 113.95,
  },
  {
    'date': DateTime.parse('2021-03-25'),
    'market': 111.22,
    'NAV': 111.17,
  },
  {
    'date': DateTime.parse('2021-03-26'),
    'market': 114.42,
    'NAV': 114.28,
  },
  {
    'date': DateTime.parse('2021-03-27'),
    'market': 119.95,
    'NAV': 119.49,
  },
  {
    'date': DateTime.parse('2021-03-28'),
    'market': 120.92,
    'NAV': 120.85,
  },
  {
    'date': DateTime.parse('2021-03-29'),
    'market': 121.93,
    'NAV': 121.64,
  },
  {
    'date': DateTime.parse('2021-03-30'),
    'market': 123.83,
    'NAV': 123.68,
  },
  {
    'date': DateTime.parse('2021-03-31'),
    'market': 121.11,
    'NAV': 120.82,
  },
  {
    'date': DateTime.parse('2021-04-01'),
    'market': 124.14,
    'NAV': 124.04,
  },
  {
    'date': DateTime.parse('2021-04-02'),
    'market': 123.26,
    'NAV': 123.17,
  },
  {
    'date': DateTime.parse('2021-04-03'),
    'market': 122.48,
    'NAV': 122.47,
  },
  {
    'date': DateTime.parse('2021-04-04'),
    'market': 127.56,
    'NAV': 127.44,
  },
  {
    'date': DateTime.parse('2021-04-05'),
    'market': 124.87,
    'NAV': 124.78,
  },
  {
    'date': DateTime.parse('2021-04-06'),
    'market': 126.62,
    'NAV': 126.54,
  },
};
