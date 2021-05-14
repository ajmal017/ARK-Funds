import 'package:arkfundsapp/providers/fund_product_group_provider.dart';

final Daily_trades1 = [
  Category(
    id: 1,
    title: 'ACCOLADE INC',
    subtitle: 'ACCD',
    amount: 2626,
  ),
  Category(
    id: 2,
    title: 'CODEXIS INC',
    subtitle: 'CDXS',
    amount: 44373,
  ),
  Category(
    id: 3,
    title: 'IONIS PHARMACEUTICAL',
    subtitle: 'IONS',
    amount: 46225,
  ),
];

final Daily_trades2 = [
  Category(
    id: 4,
    title: '3D SYSTEMS CORP',
    subtitle: 'DDD',
    amount: 141254,
  ),
  Category(
    id: 5,
    title: 'UNITY SOFTWARE INC',
    subtitle: 'U',
    amount: 187300,
  ),
  Category(
    id: 6,
    title: 'IONIS PHARMACEUTICAL ',
    subtitle: 'IONS',
    amount: 46225,
  ),
  Category(
    id: 7,
    title: 'ONE',
    subtitle: 'AONE',
    amount: 17570,
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



const PremiumDiscountData = const [
  {
    'title': 'As of Date',
    'detail': '3/24/2021',
  },
  {
    'title': 'NAV',
    'detail': '\$114.84',
  },
  {
    'title': '4PM Mid-Point',
    'detail': '\$114.36',
  },
  {
    'title': 'Difference',
    'detail': '\$0.07',
  },
  {
    'title': 'Premium/Discount',
    'detail': '0.06%',
  },
];

final PremiumDiscountChartData = {
  {
    'date': DateTime.parse('2021-04-01'),
    'value': -0.06,
  },
  {
    'date': DateTime.parse('2021-04-05'),
    'value': 0.01,
  },
  {
    'date': DateTime.parse('2021-04-06'),
    'value': 0.08,
  },
  {
    'date': DateTime.parse('2021-04-07'),
    'value': 0.00,
  },
  {
    'date': DateTime.parse('2021-04-08'),
    'value': 0.00,
  },
  {
    'date': DateTime.parse('2021-04-09'),
    'value': -0.05,
  },
  {
    'date': DateTime.parse('2021-04-12'),
    'value': -0.05,
  },
  {
    'date': DateTime.parse('2021-04-13'),
    'value': 0.11,
  },
  {
    'date': DateTime.parse('2021-04-14'),
    'value': 0.06,
  },
  {
    'date': DateTime.parse('2021-04-15'),
    'value': 0.02,
  },
  {
    'date': DateTime.parse('2021-04-16'),
    'value': 0.00,
  },
};

const HistoricalData = const [
  {
    'title': 'Greatest Premium',
    'detail': '0.13% (2/8/2021)',
  },
  {
    'title': 'Greatest Discount',
    'detail': '-0.10% (3/8/2021)',
  },
];

const NoOfDaysAt = const [
  {
    'title': 'Premium',
    'detail': '37',
  },
  {
    'title': 'NAV',
    'detail': '6',
  },
  {
    'title': 'Discount',
    'detail': '17',
  },
];

const DaysWithinPercentOfNav = const [
  {
    'title': 'Percent of Days ± 0.5% of NAV',
    'detail': '100%',
  },
  {
    'title': 'Number of Days ± 0.5% of NAV',
    'detail': '60%',
  },
];

const DescriptionForPD = const [
  'The Premium/Discount chart shows the difference between the daily market price'+
  'of the Fund’s shares and the Fund’s net asset value (“NAV”). The daily market '+
  'price is calculated using the mid-point between the highest bid and the lowest '+
  'offer on the listing exchange, as of the time that the Fund’s NAV is calculated '+
  '(usually 4:00 pm Eastern time). The vertical axis of the chart shows the premium '+
  'or discount of the Mid-Point price as a percentage of the NAV. The horizontal'+
  ' axis shows the number of trading days covered by the chart, and each bar in '+
  'the chart demonstrates how many days the Fund traded within the given premium/discount '+
  'range. The data presented in the chart and table above represent past performance '+
  'and cannot be used to predict future results.'
];
