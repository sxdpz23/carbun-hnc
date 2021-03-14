import 'package:carbun/models/blogs.dart';
import 'package:carbun/models/categories.dart';
import 'package:carbun/models/filtersCarbonEmission.dart';
import 'package:carbun/screens/carbonEmision/carbonEmission.dart';
import 'package:carbun/screens/carbonEmision/components.dart';
import 'package:carbun/screens/coupons/coupons.dart';
import 'package:carbun/screens/information/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

/// Color Scheme for the app
//
final Color primaryColor = Colors.white;
final Color secondaryColor = Color(0xFF6666FF);
final Color textColor = Colors.black;
final Color shadowColor = Colors.black26;
final Color plantAccent = Color(0xFF15D12B);
final Color accentColor = Color(0xFF3300FF);

// Categories
List<Category> categories = [
  Category(title: 'carbon emission', icon: null, navigateTo: CarbonEmission()),
  Category(
      title: 'climate change', icon: Feather.home, navigateTo: Information()),
  Category(title: 'coupons', icon: Icons.money, navigateTo: Coupons()),
];

List<FilterOptions> flightOptions = [
  FilterOptions(label: 'From'),
  FilterOptions(label: 'To'),
  FilterOptions(label: 'Via'),
  FilterOptions(label: 'Trip', values: ['RoundTrip', 'One Way']),
  FilterOptions(
      label: 'Passengers',
      values: List.generate(15, (index) => index.toString())),
  FilterOptions(
      label: 'Class',
      values: ['Economy Class', 'Business Class', 'First Class']),
];

List<FilterOptions> carOptions = [
  FilterOptions(label: 'Distance travelled (km)'),
  FilterOptions(label: 'Fuel Type', values: [
    'Biodiesel',
    'Biogas',
    'Diesel',
    'E10 (Ethanol)',
    'E85 (Ethanol)',
    'Electric',
    'Hybrid',
    'Natural Gas',
    'Petrol',
    'Plug-In Hybrid'
  ]),
  FilterOptions(label: 'Fuel Consumption'),
];

List<FilterOptions> cruiseOptions = [
  FilterOptions(label: 'Cabin', values: ['Standard', 'Suite', 'Penthouse']),
  FilterOptions(
      label: 'Cabin Occupants',
      values: ['1 Person', '2 Persons', '3 Persons', '4 Persons']),
  FilterOptions(label: 'Ship Size (Passengers)', values: [
    'Less than 500',
    '500 - 1000',
    '1000-2000',
    '2000-3000',
    '3000-4000',
    'Greater than 4000'
  ]),
  FilterOptions(label: 'Duration of Cruise (Days)'),
  FilterOptions(label: 'Total Port Stay days'),
  FilterOptions(label: 'Passengers to be Offset for'),
];

List<FilterOptions> footprintOptions = [
  FilterOptions(label: 'Means of Transport', values: [
    'I almost always go by public transport, cycle or walk',
    'I use the car and public transport about the same amount',
    'I almost always drive by car'
  ]),
  FilterOptions(label: 'Flying', values: [
    'I never fly',
    'I fly max. two short distance flights or one long distance every couple of years',
    'I fly one short distance and one long distance in a year'
  ]),
  FilterOptions(label: 'Food', values: [
    'I only eat vegetarian food',
    'I eat meat 2 to 3 times a week',
    'I eat meat almost every day - mostly from an unknown source'
  ]),
  FilterOptions(label: 'Shopping', values: [
    'I very rarely buy new products, clothes or decorative items',
    'I buy new products, clothes or decorative things every now and again',
    'I buy a new appliance, decoration, clothes or shoes every week'
  ]),
  FilterOptions(label: 'Energy', values: [
    'I live in a building that was built to be energy efficient',
    'I live in a normal building but I use renewable energy for heating',
    'I live in a normal building that is heated with oil or natural gas'
  ]),
  FilterOptions(label: 'Warm Water', values: [
    'I generally don\'t shower for longer that 5 minutes and I rarely take a bath',
    'I love standing under the shower for a good 20 minutes - but in exchange I rarely have baths',
    'I often have baths - but in exchange I shower less often and only have short showers'
  ]),
  FilterOptions(label: 'Heating', values: [
    'In winter, I wear a pullover when I am at home (18-20°C)',
    'In winter, it is pleasantly warm in my home (20-22°C)',
    'I can sit in my living room with just a T-shirt in winter (over 22°C)'
  ])
];

List<FilterOptions> householdOptions = [
  FilterOptions(
      label: 'Heating Fuel type',
      values: ['Heating Oil', 'Natural gas', 'Wood chips', 'District heating']),
  FilterOptions(label: 'Fuel Amount'),
  FilterOptions(label: 'Unit', values: ['kWh']),
  FilterOptions(label: 'Power Energy Consumption (kWh)'),
  FilterOptions(label: 'Green Energy', values: ['Yes', 'No']),
  FilterOptions(label: 'Country'),
];

// Carbon Emission Calculator
List<Filters> filterList = [
  Filters(
      label: 'Flight',
      icon: FontAwesome.plane,
      screen: Options(key: ValueKey('Flight'), list: flightOptions)),
  Filters(
      label: 'Car',
      icon: FontAwesome.car,
      screen: Options(key: ValueKey('Car'), list: carOptions)),
  Filters(
      label: 'Cruise',
      icon: FontAwesome.ship,
      screen: Options(key: ValueKey('Cruise'), list: cruiseOptions)),
  Filters(
      label: 'Footprint',
      icon: Foundation.foot,
      screen: Options(key: ValueKey('Footprint'), list: footprintOptions)),
  Filters(
      label: 'House-hold',
      icon: Foundation.home,
      screen: Options(key: ValueKey('Household'), list: householdOptions)),
  Filters(label: 'Company', icon: Icons.apartment, screen: null),
  Filters(label: 'Events', icon: Icons.event_available, screen: null),
];

String heroTagCarbonPlant = '';
Filters selectedFilter;

final List<BlogsData> blogs = [
  BlogsData(
      heading: 'Similipal forest fire: It is time to act',
      image:
          'https://cdn.downtoearth.org.in/library/large/2021-03-05/0.86998600_1614929075_simi.jpg',
      data:
          'The glowing garlands of fire lighting up the distant hill side are a scintillating sight to behold. But it comes at a heavy price: Irreversible damage to the forest and its inhabitants. Countless ground fauna — including monitor lizards, mongoose, snakes and frogs — are reduced to ashes in the blink of an eye.\n\nEntire generations of birds that nest on the ground are lost forever. Only a few can escape the raging inferno. We lose millions of seedlings and seeds, along with medicinal plants, shrubs, creepers and trees that take decades to grow.\n\nThe forest fire in Similipal, Odisha, is a phenomenon that has been in play for decades. The two main causes are well known: Poachers and non-timber forest product (NTFP) collectors. Dry, fallen leaves provide a ready source of fuel for the fire and one matchstick is enough to set the entire forest ablaze.\n\nScared animals eager to escape the leaping flames flee straight into the arms of lurking poachers. NTFP collectors of mahua flowers burn the forest floor in order to clear the dry leaf litter, which makes it easy to collect flowers. Since these fires are unsupervised, they often spread to the adjacent forest areas. To collect fresh Kendu leaves used for bidis (the local cigarettes), the bushes are slashed and set on fire for the new flush.\n\nSimilipal has a unique microclimate: It sees occasional afternoon showers during the summer months that act as natural fire controllers. There are, however, certain years wherein dry spells last for more than two-three weeks which spells disaster for the Similipal National Park.\n\nFire control in Odisha was traditionally limited to clearing fire lines to isolate fire-hit areas. The department, however, started allocating larger budgets for fire control for last seven-eight years.\n\nIt is now believed that the annual fire control budget for Odisha is Rs 50 crore. This includes temporary fire squads equipped with air blowers, vehicles and safety wire. A state-level toll free number can also be used to inform the administration of fire occurrences.\n\nUnfortunately, despite several requests by the writer, the number is publicised only through print or electronic media. Thereby, a majority of forest-dwelling communities remain unaware of the service.\n\nSeveral measures should be taken to control forest fires which involve community participation. Women NTFP collectors can be trained to sweep fallen leaves under mahua trees and burn them in a controlled manner, which will prevent the fire entering forest areas.\n\nLocal van suraksha samitis (forest protection committees) can be promised a reward if they manage to successfully prevent forest fire in their locality.\n\nIt is particularly galling that such a huge area of a major wildlife habitat in Similipal could be destroyed so easily by gangs of poachers. The state forest department engages thousands of anti-poaching personnel. So, how do they roam free in the forest?\n\nThe current situation also reveals a lack of supervision by senior park management. Similipal authorities even refused to part with the tour diaries of the director and deputy director sought under the Right to Information Act. With such dismal levels of transparency, it is not surprising that there is a little public oversight over their governance.\n\nThe fire that ravaged some areas of the forest — and continues to do so — is a symptom of the deeper malaise that affects this priceless biosphere reserve of India. The rot extends deeper since there is little political commitment to save Similipal.\n\nThe state forest minister reacted 12 days after the fire started. He tweeted March 4, 2021 about the steps the state government was taking to save Similipal — only after a social media outburst by a few central ministers.\n\nThe Odisha government is notorious for fixing accountability. Other states do better in this regard. Chhattisgarh, for example, transferred nine Indian Forest Service officers in June 2020 for failing to check the deaths of six elephant in 11 days.\n\nCrores in rupees are spent every year by the Odisha Forest Department on fire squads and vehicle hires, but little is shared with the local community that can truly help fight fires.\n\nForest fires can be fought in the first few hours itself, which is why the local community must have a role to play. They can detect the fire even before the satellite picks it up. At the same time, public oversight is effective in ensuring the forest department gets to work and is accountable for the job.'),
  BlogsData(
      heading: 'Odisha tops forest fire counts in the country for a week ',
      image:
          'https://cdn.downtoearth.org.in/library/large/2021-03-02/0.14903500_1614683057_forest.jpg',
      data:
          'At least 5,291 forest fires were recorded in Odisha between February 22 and March 1, 2021 — the highest in the country for the same period — according to the Forest Survey of India (FSI)\n\nSome cities in the state crossed the 40 degree Celsius mark on February 28, 2021. Increasing temperatures, according to experts, also sparked forest fires in the state.\n\nTelangana recorded the second-highest fires in the country at 1,527 during the same period, followed by Madhya Pradesh (1,507) and Andhra Pradesh (1,292), according to FSI data\n\nAs many as 7,188 fire spots were spotted in Odisha since November 1, the beginning of forest fire season also topped among the states in the country. Sudden jump of forest fires across Odisha resulting in massive loss of flora and fauna in forest areas\n\nCollection of mahua flowers and kendu leaves, practice of shifting cultivation and grazing in forest areas are some of the reasons for forest fires in Odisha, said Sudhakar Mohapatra, a retired forest officer. Forests are set on fire to cultivate turmeric in Baliguda forest division in Kandhamal district, he added\n\nMeanwhile, Baliguda forest division has started the ‘Ring and Strip’ method to manage forest fires. Tribal people generally set fire to dry leaves for smooth collection of mahua flowers and kendu leaves in the division\n\nThe division has adopted a method to identify mahua trees with GPS location in the villages (the individual tree is owned by a particular family). The forest officials then set the tree on fire in advance by collecting dry leaves near them under the method, which was introduced in 2018\n\nThe intervention helped reduce fire points considerably: To 2,398 (2018), 2,047 (2019) and 1,207 (2020) from 3,165 (2017)\n\n“The ring and strip method helped reduce the fire points as well as the area that was burnt,” said the divisional forest officer\n\n“We mapped around 6,000-kilometres-long fire lines in the state. We have taken precautionary measures to immediately attend to the incidents,” said a senior forest officer\n\n“Forest fires result in the loss of timbers, fruit-bearing trees and medicinal plants. They also pose a threat to the wildlife and their habitat areas,” said Biswajit Mohanty, former member of the National Board for Wildlife\n\nHe also expressed concern over wildfire in a large track of Simlipal National Park, which houses a number of wild animals and birds.'),
  BlogsData(
      heading: 'Chamoli glacier burst: It is time to learn from our mistakes',
      image:
          'https://cdn.downtoearth.org.in/library/large/2021-02-07/0.48336200_1612708255_chamoli.jpg',
      data:
          'Human activities profoundly affect the earth’s climate and mountains are a sensitive indicator of that effect. The mountain ecosystem is easily disrupted by variations in climate owing to their altitude, slope and orientation to the sun\n\nSeveral scientists believe that the change occurring in the mountain ecosystems may provide an early glimpse of what could come to pass in a lowland environment. As the earth heats up, mountains glaciers melt at unprecedented rates, while rare plants and animals struggle to survive over ever diminishing areas. As a result, people living in the mountains face a great deal of hardship\n\nMelting of Himalayan glaciers has doubled since the start of the 21st century due to rising temperature, losing over vertical foot-and-half or ice each year and potentially threatening water supply for hundreds of millions of people in counties, including India\n\nAn analysis spanning 40 years of satellite observations across India, China, Nepal, and Bhutan indicated that climate change is eating the Himalayan glaciers, according to a study published in 2019.\n\nChanges in the volume of mountain glaciers and in their seasonal melting patterns have a great impact on water resources in many parts of the world. Changes in water availability due to glacier melting because of evident change in climate are taking place at a time when pressure on water resources for irrigation and food production, industrialisation and urbanisation is increasing\n\nThe entire State of Uttarakhand is categorised as falling in Zone IV and V of the earthquake risk map of India. Previously, the region has witnessed devastating earthquakes and in the recent past earthquakes in Chamoli and flood in Kedarnath has been witnessed\n\nDespite the threat of such calamity and knowing that mountains provide large amounts of water run-off for run-of-river projects from melting snow and glacier ice, glacier lakes can pose a significant hazard and bursting of glacial lakes can cause flash floods with catastrophic consequences, the large hydropower projects are in vogue in the state\n\nAnd on February 7, 2021, we witnessed another disaster induced by climate change due to negative impact of humans on the environment: A glacier broke after an avalanche in the Joshimath area of Uttarakhand’s Chamoli district\n\nAccording to experts, reduced snowfall this winter in Uttarakhand may have played a major part in the glacier bursts. Uttarakhand is a wake-up call, not just for the rulers and people in the state, but also the planners and decision-makers all over the country\n\nThe potential of cumulative effect of multiple such projects has turned out to be more environmentally damaging than sustainable, given the current policy of the state government of pursuing hydro-power projects indiscriminately.\n\nIt is said that those who fail to learn from history are doomed to suffer from it repeatedly. It is high time, therefore, for the government to realise that the Himalayan mountains are fragile and impatient, and government shall set its development priorities and projects based on the potential of the mountains, local and traditional knowledge as well as aspirations of the place\n\nThe state itself is endowed with expertise who are there from last many years and have gained immense experience and learning about the ecology of the State\n\nSo, merely in the name of development or economic growth, please not impose any ideas and projects which are incompatible with the local environment and ecology\n\n“Let not the sacrifice of innocent victims of Uttarakhand go in vain and let not the heaven speaks go unheard”.'),
  BlogsData(
      heading:
          'Why e-rickshaws have emerged a winner in transition to electric mobility race',
      image:
          'https://cdn.downtoearth.org.in/library/large/2021-03-04/0.95892100_1614855122_rickshaw.jpg',
      data:
          'Intermediate Para Transit (IPT) — a system that facilitates flexible passenger transportation and that does not necessarily follow fixed routes and schedules — is an integral part of the mobility ecosystem in Indian cities. The toxic emissions by the conventional internal combustion engine (ICE), however, are worrisome\n\nICE-IPT vehicles contribute to vehicular pollution share: A conventional three-wheeler running on liquefied petroleum gas (LPG) emits approximately 0.005 tonnes of Particulate Matter10 (PM10) in a year and about 3.72 tonnes carbon dioxide in a year, according to a study conducted by The Energy Research Institute (TERI)\n\nAlternative fuel-based mobility options are being explored to combat these problems. And electric three-wheel based IPT segment, especially electric-rickshaws (e-rickshaw), are emerging as a winner in this transition\n\nThere are, however, multiple challenges that need to be addressed to make this transition smooth.'),
  BlogsData(
      heading:
          'Warmer winters in India: La Nina events may be getting hotter than El Nino, say experts ',
      image:
          'https://cdn.downtoearth.org.in/library/large/2021-03-03/0.03424000_1614758900_weather.jpg',
      data:
          'It’s too early to call it a summer but some places in India are already on the boil. Angul and Bhubaneswar in Odisha, for example, crossed the 40 degree Celsius mark in February 2021. Mountain states of Uttarakhand and Himachal Pradesh experienced temperatures higher than normal even in January — the time of the year usually characterised by biting cold.\n\nThe maximum temperatures soared 5-7 °C above the normal in Odisha, Chhattisgarh and Jharkhand on January 9, according to data from the India Meteorological Department (IMD)\n\nOn January 10, the minimum temperatures were even more anomalous with large parts of Uttar Pradesh, Madhya Pradesh, Chhattisgarh, Bihar, Jharkhand and Maharashtra, where night-time temperatures were at least 5°C or more above the average.'),
  BlogsData(
      heading: 'Chamoli glacier burst: Himalayan blunders compounded',
      image:
          'https://cdn.downtoearth.org.in/library/large/2021-02-11/0.26511600_1613059101_234.jpg',
      data:
          'The flash flood in high Himalayas, which has claimed lives and wiped out two hydroelectric plants on the Ganga, should be a grim reminder of the mistakes we continue to make. There is no rocket science here about why this devastation happened. The Himalayas are the world’s youngest mountain ranges, prone to erosion and landslides and unstable because of high seismic activity\n\nThis is compounded by the sheer madness — I will explain why I say this — of development, with hydropower projects being built back to back. On top of this, climate change and its resultant warming of glaciers and unseasonal snow and heat are exacerbating conditions in the already fragile ecosystem. On February 7, 2021, the people of Reni village — the birthplace of India’s environmental consciousness as this is where the women stopped the felling of trees — say they heard a loud bang.\n\nWithin minutes the muddy deluge gushed down damaging the 13.2 MW Rishiganga hydropower project and then washing away the under-construction 520 MW Tapovan-Vishnugad project downstream. It is not clear (as yet) if the glacier melted; or there was unseasonal snow that melted; or that it was a combination\n\nWhat’s clear is that there was a landslide or avalanche that blocked the river and when the natural dam broke because of the force of water, it brought the power of kilolitres of water mixed with moraine, rock and silt. It is important to note is that this flash flood occurred in winter, when there is less water; so, destruction was limited. It should be a warning of the scale of devastation that can happen. There is no question that we are going to see more of this, not less, unless we change the way we do business with the environment.\n\nBut more importantly it will happen until we take better studied decisions on the projects and on mitigating their impacts. This is where we falter. Our systems for decision-making to assess the impacts of “development” projects were already weak and have become virtually non-existent by now. The processes of decision-making are firmly in the hands of faceless and nameless committees, where papers are shuffled around to get the desired results\n\nThis is where the Himalayan saga must be understood. I saw it from the insides when I was briefly a member of an inter-ministerial group on issues related to the Ganga in 2013. What I found was appalling and, frankly, depressing. The water and power engineers had calculated the hydropower potential as 9,000 MW, which would be generated by 70-odd projects, small and big. As per their own admission these projects, mostly in the upper catchment of Uttarakhand Himalayas, would “affect” 80-90 per cent of the stretches of the river.\n\nAs these are mostly run-of-the-river projects where the water is diverted through tunnels or reservoirs and then released into the river, this meant that the river would not flow naturally, but would be re-constructed to 80-90 per cent of its length. The projects were designed to draw the last drop of water and during lean seasons, as per the project designers, the river would cease to flow naturally\n\nThe inter-ministerial group was to assess this and provide guidance on the required ecological flows. The engineers argued 10 per cent ecological flow would be adequate and this is how they had designed the plethora of projects. The interest in building hydropower was obviously huge — it came from all sides; from energy industry and construction to political leaders who saw this as development opportunities for their region. But now that the list of the projects was on the table (over 6,000 MW had not been built yet), the question was how these could be justified.\n\nI argued that the projects had to be re-worked — both the commissioned ones and those on the table — so that the ecological flow was 30 per cent of the high flood water season and 50 per cent of the low water season. I argued that projects would need to mimic the river and not the other way around. Based on extensive calculations my colleagues and I showed this re-design would not compromise on tariff or generation capacity of existing projects\n\nBut it would mean that the number of projects would need to be drastically reduced. This was not acceptable. I wrote then how hydropower researchers at the premier Indian Institute of Technology (IIT) in Roorkee then manipulated data to justify that up to 25 per cent of ecological flow for 8 months and 30 per cent in lean water months would be adequate. Forget that it would dry up the river; make the mighty Ganga — which holds the collective consciousness of the country — nothing more than an engineered drain. It was okay.\n\nMy dissent was noted. And the report cleared business as usual. Since 2013, much more water has flowed down the Ganga and there has been much activism from courts and governments about the need to curtail these projects. But after all the big talk, not much has changed\n\nAs of today, some 7,000 MW of hydroelectric projects are either operating or being constructed in this fragile region; back to back; with no respect for the river or its need to flow naturally. The issue is not about hydropower generation or the need for energy or development. It is about the carrying capacity of this fragile region, which is even more at risk because of climate change\n\nThis needs to be assessed, but by keeping the river first and our needs next. Otherwise, the river will continue to teach us bitter lessons; it will be the revenge and rage of nature. Humans will be shown as the puny things we are.')
];
