import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_tripDetails')) {
        try {
          _tripDetails = jsonDecode(prefs.getString('ff_tripDetails') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _saveCategory = prefs.getString('ff_saveCategory') ?? _saveCategory;
    });
    _safeInit(() {
      _tripHistory = prefs.getStringList('ff_tripHistory')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _tripHistory;
    });
    _safeInit(() {
      _companionHistory =
          prefs.getStringList('ff_companionHistory')?.map(int.parse).toList() ??
              _companionHistory;
    });
    _safeInit(() {
      _dateHistory = prefs
              .getStringList('ff_dateHistory')
              ?.map((x) => DateTime.fromMillisecondsSinceEpoch(int.parse(x)))
              .toList() ??
          _dateHistory;
    });
    _safeInit(() {
      _tripFavourites = prefs.getStringList('ff_tripFavourites')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _tripFavourites;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DateTime? _selectedStartDate;
  DateTime? get selectedStartDate => _selectedStartDate;
  set selectedStartDate(DateTime? value) {
    _selectedStartDate = value;
  }

  DateTime? _selectedEndDate;
  DateTime? get selectedEndDate => _selectedEndDate;
  set selectedEndDate(DateTime? value) {
    _selectedEndDate = value;
  }

  int _TimeDuration = 0;
  int get TimeDuration => _TimeDuration;
  set TimeDuration(int value) {
    _TimeDuration = value;
  }

  List<bool> _navBarTrans = [true, true, true, true];
  List<bool> get navBarTrans => _navBarTrans;
  set navBarTrans(List<bool> value) {
    _navBarTrans = value;
  }

  void addToNavBarTrans(bool value) {
    _navBarTrans.add(value);
  }

  void removeFromNavBarTrans(bool value) {
    _navBarTrans.remove(value);
  }

  void removeAtIndexFromNavBarTrans(int index) {
    _navBarTrans.removeAt(index);
  }

  void updateNavBarTransAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    _navBarTrans[index] = updateFn(_navBarTrans[index]);
  }

  void insertAtIndexInNavBarTrans(int index, bool value) {
    _navBarTrans.insert(index, value);
  }

  dynamic _selectedCityData;
  dynamic get selectedCityData => _selectedCityData;
  set selectedCityData(dynamic value) {
    _selectedCityData = value;
  }

  dynamic _cityData = jsonDecode(
      '[{\"city_id\":0,\"name\":\"Mumbai, India\",\"lat\":19.07609,\"log\":72.877426,\"top_place\":[{\"top_place_id\":0,\"name\":\"Top first activities places\",\"top_five_place\":[{\"id\":100,\"name\":\"Mabruk\",\"lat\":19.0474015,\"log\":72.8594894,\"rating\":4.5,\"place_type\":\"Restaurant\",\"location\":\"Domestic Airport Western Express Highway Hotel Sahara Star, Mumbai 400099 India\",\"phone_number\":\"+91-86574 11561\",\"open_close\":\"09:00 - 22:00\",\"website\":\"https://www.saharastar.com/dining/mabruk-mediterranean-restaurant.html\",\"review\":\"Excellent experience with dinning here. Very nice service by Vishal here. I would reccomend to all of you to come here and get unbelievable experience of dinning with your love ones.\",\"reviwer_detail\":{\"image\":\"https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D\",\"name\":\"Vikas maurya\"},\"images\":[\"https://media-cdn.tripadvisor.com/media/photo-s/0d/27/e6/15/ambience.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0d/27/e5/56/mabruk-medeterrian-restaurant.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0b/55/a9/05/mabruk-the-mediterranean.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0b/55/a8/df/chef-jehad.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/16/11/1a/be/mabruk.jpg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"description\":\"Cafe\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"description\":\"Indian cuisines\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"description\":\"Outdoor seating available\"}],\"description\":\"Mabruk - The Mediterranean restaurant, This Lebanese offing sets the mood with its casual low seating on a wooden deck and a spectacular view of the lagoon area, the pillar less clear-to-the sky dome as well as the other restaurants. Combining the sophistication and subtleties of Mediterranean cuisines with the exotic ingredients of the Middle and Far East. MABRUK, the Mediterranean, nine-time award winner for the Best Lebanese Restaurant by Times Food Guide offers rich Lebanese culture with soulful Mediterranean sounds and mouth-watering cuisine conjured by Chef Jihad. Chef Jihad creates a repertoire of traditional mezzeh complimented by carefully picked soups, main courses and desserts, creating an awe-inspiring array of flavors, textures and aromas.\"}]},{\"top_place_id\":0,\"name\":\"Top first hotels places\",\"top_five_place\":[{\"id\":100,\"name\":\"Fun kingdom\",\"lat\":19.0474015,\"log\":72.8594894,\"rating\":4.5,\"place_type\":\"Activity\",\"location\":\"Domestic Airport Western Express Highway Hotel Sahara Star, Mumbai 400099 India\",\"phone_number\":\"+91-86574 11561\",\"open_close\":\"09:00 - 22:00\",\"website\":\"https://www.saharastar.com/dining/mabruk-mediterranean-restaurant.html\",\"review\":\"Excellent experience with dinning here. Very nice service by Vishal here. I would reccomend to all of you to come here and get unbelievable experience of dinning with your love ones.\",\"reviwer_detail\":{\"image\":\"https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D\",\"name\":\"Vikas maurya\"},\"images\":[\"https://media-cdn.tripadvisor.com/media/photo-s/0d/27/e6/15/ambience.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0d/27/e5/56/mabruk-medeterrian-restaurant.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0b/55/a9/05/mabruk-the-mediterranean.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0b/55/a8/df/chef-jehad.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/16/11/1a/be/mabruk.jpg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"description\":\"Cafe\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"description\":\"Indian cuisines\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"description\":\"Outdoor seating available\"}],\"description\":\"Mabruk - The Mediterranean restaurant, This Lebanese offing sets the mood with its casual low seating on a wooden deck and a spectacular view of the lagoon area, the pillar less clear-to-the sky dome as well as the other restaurants. Combining the sophistication and subtleties of Mediterranean cuisines with the exotic ingredients of the Middle and Far East. MABRUK, the Mediterranean, nine-time award winner for the Best Lebanese Restaurant by Times Food Guide offers rich Lebanese culture with soulful Mediterranean sounds and mouth-watering cuisine conjured by Chef Jihad. Chef Jihad creates a repertoire of traditional mezzeh complimented by carefully picked soups, main courses and desserts, creating an awe-inspiring array of flavors, textures and aromas.\"}]},{\"top_place_id\":30,\"name\":\"Top first restaurants places\",\"top_five_place\":[{\"id\":100,\"name\":\"Lalit Hotel\",\"lat\":19.0474015,\"log\":72.8594894,\"rating\":4.5,\"place_type\":\"Hotel\",\"location\":\"Domestic Airport Western Express Highway Hotel Sahara Star, Mumbai 400099 India\",\"phone_number\":\"+91-86574 11561\",\"open_close\":\"09:00 - 22:00\",\"website\":\"https://www.saharastar.com/dining/mabruk-mediterranean-restaurant.html\",\"review\":\"Excellent experience with dinning here. Very nice service by Vishal here. I would reccomend to all of you to come here and get unbelievable experience of dinning with your love ones.\",\"reviwer_detail\":{\"image\":\"https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D\",\"name\":\"Vikas maurya\"},\"images\":[\"https://media-cdn.tripadvisor.com/media/photo-s/0d/27/e6/15/ambience.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0d/27/e5/56/mabruk-medeterrian-restaurant.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0b/55/a9/05/mabruk-the-mediterranean.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0b/55/a8/df/chef-jehad.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/16/11/1a/be/mabruk.jpg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"description\":\"Cafe\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"description\":\"Indian cuisines\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"description\":\"Outdoor seating available\"}],\"description\":\"Mabruk - The Mediterranean restaurant, This Lebanese offing sets the mood with its casual low seating on a wooden deck and a spectacular view of the lagoon area, the pillar less clear-to-the sky dome as well as the other restaurants. Combining the sophistication and subtleties of Mediterranean cuisines with the exotic ingredients of the Middle and Far East. MABRUK, the Mediterranean, nine-time award winner for the Best Lebanese Restaurant by Times Food Guide offers rich Lebanese culture with soulful Mediterranean sounds and mouth-watering cuisine conjured by Chef Jihad. Chef Jihad creates a repertoire of traditional mezzeh complimented by carefully picked soups, main courses and desserts, creating an awe-inspiring array of flavors, textures and aromas.\"}]}]},{\"city_id\":0,\"name\":\"Bangalore, India\",\"lat\":12.9716,\"log\":77.5946,\"top_place\":[{\"top_place_id\":0,\"name\":\"Top 5 activities places\",\"top_five_place\":[{\"id\":100,\"name\":\"Lalbagh Botanical Garden\",\"lat\":12.9507,\"log\":77.5848,\"rating\":4.4,\"place_type\":\"Activity\",\"location\":\"Lalbagh Road, Wilson Garden, Near BMTC Office, Bengaluru, Karnataka, 560004\",\"phone_number\":\"080 2657 0181\",\"open_close\":\"09:00 - 22:00\",\"website\":\"https://horticulturedir.karnataka.gov.in/page/Gardens/Lalbagh/en\",\"review\":\"A serene retreat suitable for both families and couples, offering a tranquil evening experience. Nominal ticket price of 30 rupees for adults.Boasts a rich array of natural flowers, well-maintained lawns, and diverse tree specimens.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjV3WodCJa3Y-0jBc1uVBLMmsqD2iWrZfSogjUd2Whk3Xos=w75-h75-p-rp-mo-ba4-br100\",\"name\":\"Anand Chavan\"},\"images\":[\"https://cdn2.atlantamagazine.com/wp-content/uploads/sites/4/2023/05/ABGearthgoddess_courtesy.jpg\",\"https://gumlet.assettype.com/homegrown/2023-04/62e542ca-d1a9-4e4a-a9c7-db4029c64eef/WhatsApp_Image_2023_04_05_at_17_35_23.jpeg?w=1200&h=675&auto=format%2Ccompress&fit=max&enlarge=true\",\"https://images.indianexpress.com/2022/12/botan-garden-1.jpg\",\"https://cdn2.wanderlust.co.uk/media/1016/cropped-dreamstime_xxl_5374019.jpg?anchor=center&mode=crop&width=1200&height=0&rnd=131770728440000000\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/vkwcsy60os3z/pizza.png\",\"description\":\"Cafe\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/pf0g9detm519/ticket.png\",\"description\":\"Ticket\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/1ub25lx00tqk/palmtree.png\",\"description\":\"Palm Trees\"}],\"description\":\"Mabruk - The Mediterranean restaurant, This Lebanese offing sets the mood with its casual low seating on a wooden deck and a spectacular view of the lagoon area, the pillar less clear-to-the sky dome as well as the other restaurants. Combining the sophistication and subtleties of Mediterranean cuisines with the exotic ingredients of the Middle and Far East. MABRUK, the Mediterranean, nine-time award winner for the Best Lebanese Restaurant by Times Food Guide offers rich Lebanese culture with soulful Mediterranean sounds and mouth-watering cuisine conjured by Chef Jihad. Chef Jihad creates a repertoire of traditional mezzeh complimented by carefully picked soups, main courses and desserts, creating an awe-inspiring array of flavors, textures and aromas.\"},{\"id\":101,\"name\":\"Bangalore Palace\",\"lat\":12.9982,\"log\":77.5922,\"rating\":4.6,\"place_type\":\"Activity\",\"location\":\"Palace Road, Vasanth Nagar, Bengaluru, Karnataka, 560052\",\"phone_number\":\"080 2225 8844\",\"open_close\":\"10:00 - 18:00\",\"website\":\"https://www.bangalorepalace.com/\",\"review\":\"A stunning example of Tudor architecture, the Bangalore Palace is a must-visit for history enthusiasts. Explore the regal rooms, lush gardens, and the grand ballroom. The audio-guided tour provides fascinating insights into the palace rich history.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjUip75L6UvP0J2sQUiM4mihrGag3FIoayfXdiX8vfE8cY8=w75-h75-p-rp-mo-ba4-br100\",\"name\":\"Samantha Smith\"},\"images\":[\"https://www.holidify.com/images/cmsuploads/compressed/BangalorePalace16_20190904100428_20190904100439.jpg\",\"https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_1:1/at%2Freal-estate%2Flongwood-gardens\",\"https://images.travelandleisureasia.com/wp-content/uploads/sites/2/2023/05/24101005/botanical-gardens.jpeg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/1ub25lx00tqk/palmtree.png\",\"description\":\"Palm Trees\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/qx2blot4kqne/coffee.png\",\"description\":\"Cafe\"}],\"description\":\"Built in 1887, the Bangalore Palace is a striking testament to the city royal heritage. It hosts cultural events and exhibitions, making it a vibrant center for art and history.\"},{\"id\":102,\"name\":\"Cubbon Park\",\"lat\":12.9767,\"log\":77.5907,\"rating\":4.5,\"place_type\":\"Activity\",\"location\":\"Kasturba Road, Sampangi Rama Nagar, Bengaluru, Karnataka, 560001\",\"phone_number\":null,\"open_close\":\"06:00 - 18:00\",\"website\":\"https://www.cubbonpark.org/\",\"review\":\"Cubbon Park is a green oasis in the heart of the city, offering a peaceful escape from the urban hustle. Perfect for a morning jog, family picnics, or a leisurely stroll. The park houses numerous statues, a library, and colorful flower beds.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjVGtylRYpI3A2jRJloCZPzsjoVJ1Z3xrWzV9rsvSwfTAew=w75-h75-p-rp-mo-ba6-br100\",\"name\":\"Raj Patel\"},\"images\":[\"https://thewire.in/wp-content/uploads/2016/12/bandstand.jpg\",\"https://a.travel-assets.com/findyours-php/viewfinder/images/res70/97000/97560-Bengaluru-And-Vicinity.jpg\",\"https://im.whatshot.in/img/2019/Apr/toytrain-collage-2-1554098447.jpg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/vkwcsy60os3z/pizza.png\",\"description\":\"Pizza\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/8mgi6ygfanv2/cycle.png\",\"description\":\"Cycle\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/r91sx8j28c9j/game.png\",\"description\":\"Game\"}],\"description\":\"Spread over 300 acres, Cubbon Park is a haven for nature lovers. It features a wide variety of trees and plants, making it an ideal spot for a relaxing day outdoors.\"},{\"id\":103,\"name\":\"Bangalore Aquarium\",\"lat\":12.948,\"log\":77.5907,\"rating\":4.2,\"place_type\":\"Activity\",\"location\":\"Kasturba Road, Ambedkar Veedhi, Sampangi Rama Nagar, Bengaluru, Karnataka, 560001\",\"phone_number\":\"080 2286 0818\",\"open_close\":\"10:00 - 17:30\",\"website\":\"https://www.karnataka.com/bangalore/bangalore-aquarium/\",\"review\":\"Explore the fascinating underwater world at the Bangalore Aquarium. With a diverse collection of marine life, including colorful fish and exotic species, it an educational and entertaining experience for visitors of all ages.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjU476sJaOOGpZYCmySuqYcyASEe_tOyYEtKq31uhdAxeuI=w75-h75-p-rp-mo-ba4-br100\",\"name\":\"Priya Kapoor\"},\"images\":[\"https://vijaykarnataka.com/thumb/97027057/know-more-about-tunnel-aquarium-in-bangalore-in-kannada-97027057.jpg?imgsize=167060&width=1200&height=900&resizemode=75\",\"https://c.ndtvimg.com/2021-07/2717plvg_bengaluru-rail-station-aquarium-ndtv_625x300_06_July_21.jpeg?im=Resize=(1230,900)\",\"https://images.deccanherald.com/deccanherald/import/sites/dh/files/articleimages/2022/10/07/file7lqdajyl9li19m97njcj-1151319-1665089322.jpg?w=1200&h=675&auto=format%2Ccompress&fit=max&enlarge=true\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/pf0g9detm519/ticket.png\",\"description\":\"Ticket\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/2fjizh9w5mc7/calendar.png\",\"description\":\"Calendar\"}],\"description\":\"The Bangalore Aquarium, established in 1983, showcases a stunning array of aquatic life. Educational programs and interactive exhibits make it an engaging destination for families and school groups.\"},{\"id\":104,\"name\":\"UB City Mall\",\"lat\":12.9716,\"log\":77.5961,\"rating\":4.7,\"place_type\":\"Activity\",\"location\":\"24, Vittal Mallya Road, D Souza Layout, Sampangi Rama Nagar, Bengaluru, Karnataka, 560001\",\"phone_number\":\"080 2213 2520\",\"open_close\":\"10:00 - 21:00\",\"website\":\"https://www.ubcitymall.com/\",\"review\":\"UB City Mall is a luxury shopping destination with high-end brands, exquisite dining options, and a sophisticated ambiance. It a haven for fashion enthusiasts and those looking for a premium shopping experience.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjWl2uhzefIrTcusjS3Fyd89WcaJkSGg0mLvDoUUVftyea4=w75-h75-p-rp-mo-ba4-br100\",\"name\":\"Amit Shah\"},\"images\":[\"https://upload.wikimedia.org/wikipedia/commons/5/5e/UBtowers.jpg\",\"https://imgstaticcontent.lbb.in/lbbnew/wp-content/uploads/sites/2/2016/05/UBCity.jpg\",\"https://live.staticflickr.com/65535/46927249514_584d2ea8be_b.jpg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/qx2blot4kqne/coffee.png\",\"description\":\"Cafe\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/ppfw4scyxo24/burger.png\",\"description\":\"Fast Food\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/pi9q0lj42oxh/chef.png\",\"description\":\"Personal Chef\"}],\"description\":\"UB City Mall, located in the central business district, is synonymous with luxury and style. From international fashion labels to gourmet cuisine, it offers a curated selection of the finest experiences.\"}]},{\"top_place_id\":0,\"name\":\"Top 5 hotels places\",\"top_five_place\":[{\"id\":201,\"name\":\"Truffles - Ice & Spice\",\"lat\":12.9664,\"log\":77.6403,\"rating\":4.7,\"place_type\":\"Restaurant\",\"location\":\"26, 80 Feet Road, 7th Block, Koramangala, Bengaluru, Karnataka, 560095\",\"phone_number\":\"+91-8040945370\",\"open_close\":\"11:00 - 23:00\",\"website\":\"https://truffles.co.in/\",\"review\":\"Known for its delectable burgers and cozy ambiance, Truffles is a favorite among locals. The menu offers a variety of international and Indian dishes. The friendly staff and vibrant atmosphere make it a great place for casual dining.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjUMK8UbaYYj3tZB0yBDc9gqmYJ5Lb7Vb8PJ4HPPck03XRc=w75-h75-p-rp-mo-br100\",\"name\":\"Alisha Kapoor\"},\"images\":[\"https://imgmedia.lbb.in/media/2019/10/5db6ab106a189489edace42c_1572252432919.jpg\",\"https://imgmedia.lbb.in/media/2019/10/5db6ab1e297db5110835025a_1572252446097.jpg\",\"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxXaBk_Dp3dKGvaqjs4PbYVbbEYQuADWR-Eg&usqp=CAU\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/ppfw4scyxo24/burger.png\",\"description\":\"Burgers\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/pi9q0lj42oxh/chef.png\",\"description\":\"Italian Cuisine\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/dmsdsmowv6pm/wedding-dinner.png\",\"description\":\"Cozy Ambiance\"}],\"description\":\"Truffles - Ice & Spice is a popular eatery in Koramangala, known for its diverse menu and warm atmosphere. Whether you are craving a juicy burger or flavorful pasta, Truffles has something for everyone.\"},{\"id\":202,\"name\":\"Toit Brewpub\",\"lat\":12.9718,\"log\":77.5954,\"rating\":4.6,\"place_type\":\"Restaurant\",\"location\":\"298, 100 Feet Road, Near KFC Restaurant, Indiranagar, Bengaluru, Karnataka, 560038\",\"phone_number\":\"+91-9019713388\",\"open_close\":\"12:00 - 01:00\",\"website\":\"https://toit.in/\",\"review\":\"Toit Brewpub is a haven for beer enthusiasts, offering a wide range of craft beers and delicious pub grub. The lively ambiance and rooftop seating add to the overall experience. A perfect spot for socializing and enjoying quality brews.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjUdRwNSYnYiLdF0wlANmGBDuUZY082sAoLBWuev2zv4HxQY=w75-h75-p-rp-mo-ba5-br100\",\"name\":\"Rahul Singh\"},\"images\":[\"https://images.picxy.com/cache/2020/6/13/320172a0cb92f70e196ddeded7d24930.webp\",\"https://static.toiimg.com/thumb/33121921/5019978927_db2f520a26_b.jpg?width=1200&height=900\",\"https://b.zmtcdn.com/data/pictures/5/51705/76fa67b59c91a24d6e987de09921fcd7.jpg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/sc8svf0b6iar/alchol.png\",\"description\":\"Craft Beer\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/qx2blot4kqne/coffee.png\",\"description\":\"Coffee\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/dmsdsmowv6pm/wedding-dinner.png\",\"description\":\"Rooftop Seating\"}],\"description\":\"Toit Brewpub is a well-known establishment in Indiranagar, offering an extensive selection of craft beers and a menu filled with delicious pub-style dishes. The vibrant atmosphere and rooftop setting make it a popular choice.\"},{\"id\":203,\"name\":\"Ebony Fine-Dine\",\"lat\":12.9714,\"log\":77.6196,\"rating\":4.8,\"place_type\":\"Restaurant\",\"location\":\"84, 13th Floor, Barton Centre, MG Road, Bengaluru, Karnataka, 560001\",\"phone_number\":\"+91-8065441800\",\"open_close\":\"12:30 - 15:00, 19:00 - 23:30\",\"website\":\"https://www.ebonyfine-dine.com/\",\"review\":\"Experience culinary excellence at Ebony Fine-Dine, offering a sophisticated dining experience with panoramic views of the city. The menu features a fusion of global cuisines prepared with precision and creativity.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjWB5ikYxzTp8u4zrggYYc2rvy-KMAieZvHghCzXW8-_evva=w75-h75-p-rp-mo-ba2-br100\",\"name\":\"Neha Gupta\"},\"images\":[\"https://b.zmtcdn.com/data/pictures/7/50407/1d94f1199b634edb58bbc26d2a01d72c.jpg\",\"https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/2019-06/ebony-1200_0.jpg\",\"https://images.lifestyleasia.com/wp-content/uploads/sites/7/2022/09/07081644/Untitled-design-13-1600x900.jpg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/pi9q0lj42oxh/chef.png\",\"description\":\"Fine Dining\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/dmsdsmowv6pm/wedding-dinner.png\",\"description\":\"Panoramic Views\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/35k224o0fsx1/veg.png\",\"description\":\"Global Cuisine\"}],\"description\":\"Ebony Fine-Dine, located on the 13th floor of Barton Centre, offers a luxurious dining experience with breathtaking views. The carefully curated menu combines flavors from around the world, creating a culinary masterpiece.\"},{\"id\":204,\"name\":\"Sunny Restaurant\",\"lat\":12.9715,\"log\":77.6001,\"rating\":4.5,\"place_type\":\"Restaurant\",\"location\":\"34, Embassy Diamante, Ground Floor, Vyalikaval, Bengaluru, Karnataka, 560003\",\"phone_number\":\"+91-8023441777\",\"open_close\":\"12:00 - 15:30, 19:00 - 23:00\",\"website\":\"https://www.sunnysbangalore.com/\",\"review\":\"Sunny Restaurant is a charming Italian eatery known for its delectable pasta, wood-fired pizzas, and warm ambiance. The cozy setting and attentive service make it an ideal spot for a romantic dinner or family celebration.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjUlba9TSyvxvI3OqS8UYl4ii1bK4UfZcMjg7NwaiOX2pDvL=w75-h75-p-rp-mo-ba5-br100\",\"name\":\"Kunal Verma\"},\"images\":[\"https://b.zmtcdn.com/data/pictures/3/56803/dfce82eea094ce2a57d24cd4cb203816.jpg\",\"https://b.zmtcdn.com/data/pictures/3/56803/efd4280269d07ee8b4ac973f976e310d.jpg?fit=around|960:500&crop=960:500;*,*\",\"https://b.zmtcdn.com/data/pictures/3/56803/53eac69dcd58a854e4241967310f09d5.jpg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/35k224o0fsx1/veg.png\",\"description\":\"Italian Cuisine\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/vkwcsy60os3z/pizza.png\",\"description\":\"Wood-Fired Pizza\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/sc8svf0b6iar/alchol.png\",\"description\":\"Romantic Dinner\"}],\"description\":\"Sunny Restaurant, located in Vyalikaval, is a hidden gem for Italian cuisine enthusiasts. Indulge in a culinary journey with authentic flavors, carefully crafted dishes, and a cozy atmosphere.\"},{\"id\":205,\"name\":\"The Tao Terraces\",\"lat\":12.9717,\"log\":77.6012,\"rating\":4.4,\"place_type\":\"Restaurant\",\"location\":\"5th Floor, 1 MG Mall, MG Road, Bengaluru, Karnataka, 560008\",\"phone_number\":\"+91-8884494030\",\"open_close\":\"12:00 - 15:30, 19:00 - 23:00\",\"website\":\"https://thetaoterraces.com/\",\"review\":\"The Tao Terraces offers an exquisite blend of Asian flavors in a chic rooftop setting. With a diverse menu and creative cocktails, it a perfect destination for those seeking a modern twist on traditional Asian cuisine.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjXlD3JyFDkUiUDyHizjrGA4Gx-GjjVVSv2saWk7VaJn7etG=w75-h75-p-rp-mo-ba3-br100\",\"name\":\"Riya Sharma\"},\"images\":[\"https://cdn0.weddingwire.in/vendor/9707/3_2/960/jpg/30124627-1742987779054718-4545641108020920320-n_15_139707.jpeg\",\"https://image.wedmegood.com/resized/800X/uploads/member/983007/1582089879_Screenshot_from_2020_02_19_10_52_38.png\",\"https://cdn0.weddingwire.in/vendor/9707/3_2/960/jpg/31369735-1762796310407198-1085002609774821376-n_15_139707.jpeg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/pi9q0lj42oxh/chef.png\",\"description\":\"Asian Fusion\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/dmsdsmowv6pm/wedding-dinner.png\",\"description\":\"Rooftop Setting\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/sc8svf0b6iar/alchol.png\",\"description\":\"Creative Cocktails\"}],\"description\":\"The Tao Terraces, located on the 5th floor of 1 MG Mall, is a haven for those seeking a modern twist on Asian cuisine. The rooftop setting, diverse menu, and creative cocktails create an unforgettable dining experience.\"}]},{\"top_place_id\":30,\"name\":\"Top 5 restaurants places\",\"top_five_place\":[{\"id\":301,\"name\":\"The Oberoi, Bengaluru\",\"lat\":12.9716,\"log\":77.5956,\"rating\":4.8,\"place_type\":\"Hotel\",\"location\":\"37-39, MG Road, Yellappa Garden, Yellappa Chetty Layout, Bengaluru, Karnataka, 560001\",\"phone_number\":\"+91-8067243000\",\"open_close\":\"24 hours\",\"website\":\"https://www.oberoihotels.com/hotels-in-bengaluru/\",\"review\":\"Experience luxury at its finest at The Oberoi, Bengaluru. With impeccable service, elegant rooms, and world-class amenities, it the perfect choice for those seeking a sophisticated stay in the heart of the city.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjUnDH4fTIoOQVsey-nWVbkpq5OG_VszMV5TqkPwjbMaAba1=w75-h75-p-rp-mo-br100\",\"name\":\"Bhagwat gore \"},\"images\":[\"https://images.trvl-media.com/lodging/1000000/30000/21700/21672/12a636db.jpg?impolicy=fcrop&w=1200&h=800&p=1&q=medium\",\"https://cf.bstatic.com/xdata/images/hotel/max1024x768/34133704.jpg?k=ffd111ca90c31bae63ece2e2d9ed3ff7f59856dd67d602b756f014f11814aa2a&o=&hp=1\",\"https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/flyfish/raw/NH74046247892688/QS1042/QS1042-Q1/IMG-20230223-WA0002.jpg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/gepw1mpz8c9f/Luxury_Hotel.png\",\"description\":\"Luxury Hotel\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/0ubuk96s4umm/bedroom-icon-4.png\",\"description\":\"Elegant Rooms\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/uop64i5lro38/pngtree-flat-design-set-of-apartment-amenities-with-long-shadows-vector-png-image_30579068.png\",\"description\":\"World-class Amenities\"}],\"description\":\"The Oberoi, Bengaluru, located on MG Road, offers a blend of luxury and comfort. Indulge in spacious rooms, fine dining, and personalized services that redefine the essence of a luxurious stay.\"},{\"id\":302,\"name\":\"Taj West End\",\"lat\":12.9844,\"log\":77.5845,\"rating\":4.7,\"place_type\":\"Hotel\",\"location\":\"Race Course Road, High Grounds, Sampangi Rama Nagar, Bengaluru, Karnataka, 560001\",\"phone_number\":\"+91-8067255255\",\"open_close\":\"24 hours\",\"website\":\"https://www.tajhotels.com/en-in/taj/taj-west-end-bengaluru/\",\"review\":\"Step into the timeless charm of Taj West End, a heritage hotel surrounded by lush gardens. With its colonial architecture and modern amenities, the hotel offers a serene escape in the midst of the bustling city.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjWH0gnXrD5HoKgP04tuKZfaYBF_vWrDXNmD4kUsQ0MSieY=w75-h75-p-rp-mo-br100\",\"name\":\"Emily Davis\"},\"images\":[\"https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/flyfish/raw/NH73242269088090/QS1042/QS1042-Q1/1688047425914.jpeg\",\"https://www.momondo.in/himg/39/68/0c/revato-161963-12390305-672974.jpg\",\"https://content.jdmagicbox.com/comp/bangalore/81/080p1281/catalogue/the-taj-west-end-hotel-race-course-road-bangalore-hotels-y4s0rq.jpg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/gepw1mpz8c9f/Luxury_Hotel.png\",\"description\":\"Heritage Hotel\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/jr6hti1wz0cc/garden.png\",\"description\":\"Lush Gardens\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/1t8h7vov2k0p/arch.png\",\"description\":\"Colonial Architecture\"}],\"description\":\"Taj West End, nestled in High Grounds, is a heritage hotel that seamlessly blends old-world charm with modern luxury. Explore the expansive gardens and experience the epitome of gracious living.\"},{\"id\":303,\"name\":\"ITC Gardenia, Bengaluru\",\"lat\":12.9718,\"log\":77.5954,\"rating\":4.6,\"place_type\":\"Hotel\",\"location\":\"No.1, Residency Road, Bengaluru, Karnataka, 560025\",\"phone_number\":\"+91-8067235757\",\"open_close\":\"24 hours\",\"website\":\"https://www.itchotels.com/in/en/itcgardenia.html\",\"review\":\"Experience opulence at ITC Gardenia, Bengaluru, where luxury meets sustainability. Immerse yourself in elegant surroundings, culinary delights, and eco-friendly initiatives that redefine modern hospitality.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjVHR_MrFvt9W4UHrneaxymgoKR38dV0GJ6IP8yb0YFP3Ah1=w75-h75-p-rp-mo-ba3-br100\",\"name\":\"Priya Kulageri\"},\"images\":[\"https://www.itchotels.com/content/dam/itchotels/in/umbrella/itc/hotels/itcgardenia-bengaluru/images/overview-landing-page/headmast/desktop/itc-gardenia.png\",\"https://www.itchotels.com/content/dam/itchotels/in/umbrella/itc/hotels/itcgardenia-bengaluru/images/overview-landing-page/headmast/desktop/lotus-pavillion.png\",\"https://cf.bstatic.com/xdata/images/hotel/max1024x768/467528613.jpg?k=29dfe44a4ec3e01258b6edeb5738369c7a2a768e44772651ea186eff22185531&o=&hp=1\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/gepw1mpz8c9f/Luxury_Hotel.png\",\"description\":\"Luxury Hotel\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/2h1n1m6hdmad/Elegant_Surroundings.png\",\"description\":\"Elegant Surroundings\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/5mv2md8ypjgx/Eco-Friendly_Initiatives.png\",\"description\":\"Eco-Friendly Initiatives\"}],\"description\":\"ITC Gardenia, located on Residency Road, is a luxurious escape promoting sustainability. Indulge in world-class hospitality, fine dining, and responsible practices that contribute to a greener future.\"},{\"id\":304,\"name\":\"Sheraton Grand Bangalore Hotel at Brigade Gateway\",\"lat\":13.0127,\"log\":77.5565,\"rating\":4.5,\"place_type\":\"Hotel\",\"location\":\"26/1 Dr. Rajkumar Road, Malleswaram-Rajajinagar, Bengaluru, Karnataka, 560055\",\"phone_number\":\"+91-8045116200\",\"open_close\":\"24 hours\",\"website\":\"https://www.marriott.com/hotels/travel/blrbs-sheraton-grand-bangalore-hotel-at-brigade-gateway/\",\"review\":\"Sheraton Grand Bangalore Hotel is a perfect blend of business and luxury. With state-of-the-art facilities, spacious rooms, and convenient location, it caters to the needs of both corporate and leisure travelers.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjU6wz7-ehdkqpDKZih5p8kqBZGrHseLlFxUwgzPNJJQLlc=w75-h75-p-rp-mo-ba6-br100\",\"name\":\"Amir Ehsaei\"},\"images\":[\"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/2f/5f/2e/exterior.jpg?w=700&h=-1&s=1\",\"https://cache.marriott.com/content/dam/marriott-renditions/BLRGS/blrgs-deluxe-room-7963-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px:*\",\"https://cdn.brigadegroup.com/properties/gallery/14987347755954e0b729551.jpg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/wyqm7s5dbcaq/Business_Hotel.jpg\",\"description\":\"Business Hotel\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/xhqvn19xe3lm/State-of-the-Art_Facilities.png\",\"description\":\"State-of-the-Art Facilities\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/mpyubjj5167x/Convenient_Location.png\",\"description\":\"Convenient Location\"}],\"description\":\"Sheraton Grand Bangalore Hotel at Brigade Gateway, situated on Dr. Rajkumar Road, is a premium business hotel offering a seamless blend of modern amenities and unmatched hospitality for both business and leisure travelers.\"},{\"id\":305,\"name\":\"The Ritz-Carlton, Bangalore\",\"lat\":12.9719,\"log\":77.5951,\"rating\":4.4,\"place_type\":\"Hotel\",\"location\":\"99, Residency Road, Bengaluru, Karnataka, 560025\",\"phone_number\":\"+91-8067698888\",\"open_close\":\"24 hours\",\"website\":\"https://www.ritzcarlton.com/en/hotels/india/bangalore\",\"review\":\"Indulge in the epitome of luxury at The Ritz-Carlton, Bangalore. With its timeless elegance, world-class amenities, and impeccable service, it offers a haven for those seeking an extraordinary stay.\",\"reviwer_detail\":{\"image\":\"https://lh3.googleusercontent.com/a-/ALV-UjUMKDB77s7DCFR_wtCC2VtQtiLPlm-mmuMEgfuAyGAKxh2b=w75-h75-p-rp-mo-br100\",\"name\":\"Elodie ANTOINE\"},\"images\":[\"https://global-uploads.webflow.com/5cf16f74881a650c03c2f354/605fb766d9ea2761aa45dfe7_5ea1d63806d5f8ddde285e8c_The%2520Ritz-Carlton%252C%2520Bangalore%2520general.jpeg\",\"https://cache.marriott.com/content/dam/marriott-renditions/BLRRZ/blrrz-grand-deluxe-4780-hor-wide.jpg?output-quality=70&interpolation=progressive-bilinear&downsize=1336px:*\",\"https://cf.bstatic.com/xdata/images/hotel/max1024x768/484994644.jpg?k=696638cbbab792ca3cb3e562c3531b9fd141e9f9c208c848bfed534641a65920&o=&hp=1\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/gepw1mpz8c9f/Luxury_Hotel.png\",\"description\":\"Luxury Hotel\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/lpo0unnh7p5f/interaction-time-icon-with-people-vector.jpg\",\"description\":\"Timeless Elegance\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/harshit-travel-app-ts858q/assets/uop64i5lro38/pngtree-flat-design-set-of-apartment-amenities-with-long-shadows-vector-png-image_30579068.png\",\"description\":\"World-class Amenities\"}],\"description\":\"The Ritz-Carlton, located on Residency Road, is a symbol of unparalleled luxury. Immerse yourself in a world of sophistication, where every detail is meticulously crafted to provide an exceptional and memorable experience.\"}]}]}]');
  dynamic get cityData => _cityData;
  set cityData(dynamic value) {
    _cityData = value;
  }

  List<dynamic> _selectedTopFive = [];
  List<dynamic> get selectedTopFive => _selectedTopFive;
  set selectedTopFive(List<dynamic> value) {
    _selectedTopFive = value;
  }

  void addToSelectedTopFive(dynamic value) {
    _selectedTopFive.add(value);
  }

  void removeFromSelectedTopFive(dynamic value) {
    _selectedTopFive.remove(value);
  }

  void removeAtIndexFromSelectedTopFive(int index) {
    _selectedTopFive.removeAt(index);
  }

  void updateSelectedTopFiveAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _selectedTopFive[index] = updateFn(_selectedTopFive[index]);
  }

  void insertAtIndexInSelectedTopFive(int index, dynamic value) {
    _selectedTopFive.insert(index, value);
  }

  dynamic _sampleCityData = jsonDecode(
      '[{\"city_id\":0,\"name\":\"Mumbai, India\",\"lat\":19.07609,\"log\":72.877426,\"top_place\":[{\"top_place_id\":0,\"name\":\"Top 5 romantic places\",\"top_five_place\":[{\"id\":100,\"name\":\"Mabruk\",\"lat\":19.0474015,\"log\":72.8594894,\"rating\":4.5,\"type\":{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"name\":\"romantic\"},\"place_type\":\"Restaurant\",\"location\":\"Domestic Airport Western Express Highway Hotel Sahara Star, Mumbai 400099 India\",\"phone_number\":\"+91-86574 11561\",\"open_close\":\"09:00 - 22:00\",\"website\":\"https://www.saharastar.com/dining/mabruk-mediterranean-restaurant.html\",\"review\":\"Excellent experience with dinning here. Very nice service by Vishal here. I would reccomend to all of you to come here and get unbelievable experience of dinning with your love ones.\",\"reviwer_detail\":{\"image\":\"https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D\",\"name\":\"Vikas maurya\"},\"images\":[\"https://media-cdn.tripadvisor.com/media/photo-s/0d/27/e6/15/ambience.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0d/27/e5/56/mabruk-medeterrian-restaurant.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0b/55/a9/05/mabruk-the-mediterranean.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0b/55/a8/df/chef-jehad.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/16/11/1a/be/mabruk.jpg\"],\"box_records\":[{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"description\":\"Cafe\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"description\":\"Indian cuisines\"},{\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/new-traval-app-2lwok0/assets/0mjwjtdw98zl/burger.png\",\"description\":\"Outdoor seating available\"}],\"description\":\"Mabruk - The Mediterranean restaurant, This Lebanese offing sets the mood with its casual low seating on a wooden deck and a spectacular view of the lagoon area, the pillar less clear-to-the sky dome as well as the other restaurants. Combining the sophistication and subtleties of Mediterranean cuisines with the exotic ingredients of the Middle and Far East. MABRUK, the Mediterranean, nine-time award winner for the \\\"Best Lebanese Restaurant\\\" by Times Food Guide offers rich Lebanese culture with soulful Mediterranean sounds and mouth-watering cuisine conjured by Chef Jihad. Chef Jihad creates a repertoire of traditional mezzeh\'s complimented by carefully picked soups, main courses and desserts, creating an awe-inspiring array of flavors, textures and aromas.\"}]}]}]');
  dynamic get sampleCityData => _sampleCityData;
  set sampleCityData(dynamic value) {
    _sampleCityData = value;
  }

  bool _isConfettiOn = false;
  bool get isConfettiOn => _isConfettiOn;
  set isConfettiOn(bool value) {
    _isConfettiOn = value;
  }

  dynamic _tripDetails = jsonDecode(
      '{\"city\":\"Jaipur\",\"trip\":[{\"day\":\"Day 1\",\"activities\":[{\"type\":\"Historical\",\"place_name\":\"The City Palace\",\"place_desc\":\"City Palace forms one of the most famous tourist attractions and a major landmark in Jaipur. The beautiful palace was built by Maharaja Sawai Jai Singh during his reign. Among the various forts and palaces of Jaipur, City Palace stands apart, with its outstanding art and architecture.\",\"rating\":7,\"reviews\":1700,\"latlng\":\"26.925876,75.823581\",\"images\":[\"https://images.pexels.com/photos/19149605/pexels-photo-19149605/free-photo-of-a-room-with-blue-and-white-walls-and-ceiling.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1\",\"https://images.pexels.com/photos/18881278/pexels-photo-18881278/free-photo-of-amer-fort-in-india.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1\",\"https://www.holidify.com/images/cmsuploads/compressed/shutterstock_1081660136(1)_20190904115748.jpg\",\"https://images.pexels.com/photos/2870167/pexels-photo-2870167.jpeg?auto=compress&cs=tinysrgb&w=600\"],\"time_to_visit\":\"2 hours\"},{\"type\":\"Adventure\",\"place_name\":\"Hot Air Balloon\",\"place_desc\":\"The Hot Air Balloon Jaipur offers you an opportunity to experience Jaipur from the wide view that will soothe your senses. The view from the sky looks beautiful and butterflies dance in your belly as you keep flying in the sky. Gear up for an amazing experience in the hot air balloon and explore the city from the height. Get a first flight certificate signed by a pilot after completion of the Safari. Grab the opportunity to get interact or take pictures with local villagers at the landing site.\",\"rating\":8,\"reviews\":1200,\"latlng\":\"26.996876,75.998581\",\"images\":[\"https://static2.tripoto.com/media/filter/nl/img/1018835/TripDocument/1545062112_media_base_sky_waltz_balloon_safari_jaipur_2018_9_11_t_18_20_45.jpeg\",\"https://imgcld.yatra.com/ytimages/image/upload/t_ann_trip_gallery_main/v1517481215/AdvNation/ANN_TRP512/Dubai-Hot-Air-Ballooning_1439553571_Lv7oNW.jpg\",\"https://static2.tripoto.com/media/filter/nl/img/1018835/TripDocument/1545063331_jaipur_rajasthan.jpg\",\"https://static2.tripoto.com/media/filter/nl/img/1018835/TripDocument/1545063366_5_flying_with_friends_final.png\"],\"time_to_visit\":\"2 hours\"},{\"type\":\"Cuisine\",\"place_name\":\"WTF Sports Lounge\",\"place_desc\":\"Watch Treat Freak is the real name of WTF. This trendy sports bar is new in Jaipur but has already gained a lot of followers due to its enjoyable atmosphere and mouthwatering food menu. Enjoy your special evening dancing with your loved ones to different musical genres, including techno, retro, pop, and house. Party like never before while grooving to DJs and enjoying some delectable foods and premium beverages. Check out some fun dance performances or karaoke. So, book your tickets right away and enjoy a night out with your loved ones.\",\"rating\":9,\"reviews\":4200,\"latlng\":\"27.117511,75.998583\",\"images\":[\"https://media-cdn.tripadvisor.com/media/photo-s/0e/90/54/47/party-scenes.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0e/90/55/bc/wine-at-it-best.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/0e/90/55/4e/delicious-food.jpg\",\"https://media-cdn.tripadvisor.com/media/photo-s/10/5d/3c/ca/private-section-area.jpg\"],\"time_to_visit\":\"2 hours\"}]},{\"day\":\"Day 2\",\"activities\":[{\"type\":\"Adventure\",\"place_name\":\"Ranthambore National Park Safari\",\"place_desc\":\"Ranthambore National Park is one of the largest and best tiger reserves in the country. Home to over 80 tigers the national park is spread over an area of 392 square km. More than 320 species of animals, birds and reptiles can be found and seen in the Ranthambore National Park. So why wait? Visit the Ranthambore National Park today and see the national animal of India in its natural habitat.\",\"rating\":8,\"reviews\":1700,\"latlng\":\"27.439999,75.999999\",\"images\":[\"https://assets.traveltriangle.com/blog/wp-content/uploads/2016/08/Untitled-design-33.jpg\",\"https://www.ranthamboresafaripackage.com/wp-content/uploads/2023/09/ranthambore-national-parrk.jpg\",\"https://www.travelplanraj.com/tourpackage/tiger-a.jpg\",\"https://www.monsoonforest.com/wp-content/uploads/2018/09/bandhavgarh-jeep-safari-1.jpg\"],\"time_to_visit\":\"4 hours\"},{\"type\":\"Relaxing\",\"place_name\":\"Kerala Ayurveda Kendra\",\"place_desc\":\"We have just one location in Jaipur-we dont have any other location or branch.Kerala Ayurveda Kendra is devoted to our age old Indian system of medicine, The Ayurveda, with holistic approach. At Kerala Ayurveda Kendra, we have integrated healing and wellness modalities from various stream of healing with relaxing experience. Kerala Ayurveda Kendra service includes Ayurveda consultation, Ayurveda medicines, Ayurveda therapies, , Ayurveda massage-panchkarma training courses etc. We do not offer cross gender massage. We just have One location-center in Jaipur.\",\"rating\":9,\"reviews\":7000,\"latlng\":\"27.489999,75.999999\",\"images\":[\"https://www.keralatourism.org/images/hri/large/ayurveda_medicines_2.jpg\",\"https://www.keralatourism.org/images/hri/large/massage_in_ayurveda_5.jpg\",\"https://www.keralatourism.org/images/hri/large/preparation_of_ayurvedic_medicines_8.jpg\",\"https://www.keralatourism.org/images/hri/large/shirodhara_with_milk_ayurveda_therapy_236.jpg\"],\"time_to_visit\":\"2 hours\"}]},{\"day\":\"Day 3\",\"activities\":[{\"type\":\"Romantic\",\"place_name\":\"Rose Garden\",\"place_desc\":\"Next to city centre, in Sector 16 is situated Zakir Hussain Rose Garden Asia largest Rose Garden and is spreaded over 30 acres of land having over 1600 different species or roses. These have been planted beautifully carved out lawns and flowers beds. Like the cultural zone which is just across the road in sector 10,this was also planned by Dr. M.S. Randhawa as his interest in horticulture and fondness for flowers was profuse.\",\"rating\":7,\"reviews\":1700,\"latlng\":\"27.589999,75.999999\",\"images\":[\"https://w0.peakpx.com/wallpaper/257/332/HD-wallpaper-beautiful-rose-garden-flowers-garden-nature-beautiful-roses.jpg\",\"https://i.pinimg.com/564x/ea/55/7b/ea557bb74336ee0f131ba0e5a108eddb.jpg\",\"https://glamadelaide.com.au/wp-content/uploads/2022/10/rosepavilion6.jpeg\",\"https://www.visitmesa.com/imager/s3_us-west-1_amazonaws_com/mesa-2019/images/blog-images/Rose-Garden-at-MCC-arch_841aebc5d2d06c6b5a5884eccea9077a.jpeg\"],\"time_to_visit\":\"2 hours\"},{\"type\":\"Adventure\",\"place_name\":\"Dirt bike tour\",\"place_desc\":\"sjflskjflksdjflksdajflksdajflkjsadlkfjsdklfjklsdjflksdjflksadjflkjsadklf.\",\"rating\":8,\"reviews\":4571,\"latlng\":\"27.499999,75.999999\",\"images\":[\"https://c4.wallpaperflare.com/wallpaper/1009/965/79/motocross-racing-motocross-dirt-bike-with-motocross-rider-photo-wallpaper-preview.jpg\",\"https://images4.alphacoders.com/766/76626.jpg\",\"https://www.hdwallpapers.in/thumbs/2021/white_blue_dirt_bike_in_dusty_sand_background_hd_dirt_bike-t2.jpg\",\"https://www.dirtbikeplanet.com/wp-content/uploads/2019/08/69571908_l.jpg\"],\"time_to_visit\":\"4 hours\"}]},{\"day\":\"Day 4\",\"activities\":[{\"type\":\"Shopping\",\"place_name\":\"Anokhi – For Colorful Garments\",\"place_desc\":\"If you’re an admirer of beautiful bright prints and handcrafted fabrics, then Anokhi will definitely not disappoint you. Holding different chains of stores, this place has made a mark with its distinguished designs, prints and range of colors which makes it one of the best shopping places in Jaipur. So how can you miss this paradise shop while roaming in the city of art and crafts.\",\"rating\":9,\"reviews\":1900,\"latlng\":\"27.599999,75.999999\",\"images\":[\"https://www.anokhi.com/wp-content/uploads/2022/02/Hyderabad-2.jpg\",\"https://res.cloudinary.com/purnesh/image/upload/w_1000,f_auto/anokhi-header-image.jpg\",\"https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Siam_traditional_clothes.jpg/1200px-Siam_traditional_clothes.jpg\",\"https://www.anokhi.com/wp-content/uploads/2022/02/Hyderabad-2.jpg\"],\"time_to_visit\":\"5 hours\"},{\"type\":\"Adventure\",\"place_name\":\"Kaleidoscope\",\"place_desc\":\"Like the name itself, this unique place offers a kaleidoscope of rich and vibrant colors with its quirky interiors that showcase plush velvet lounge chairs, chiffon curtains, and salvaged wood on the ceiling, thereby uplifting one’s mood. Added to that the innovative mocktails, and delicious meals take the happiness meter through the roof making it undoubtedly one of the best restaurants.\",\"rating\":8,\"reviews\":9571,\"latlng\":\"27.6999999,75.999999\",\"images\":[\"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/08/10/b5/57/jantar-mantar-jaipur.jpg?w=2200&h=-1&s=1\",\"https://b.zmtcdn.com/data/pictures/2/18471462/54173e74f0e81199be8f7da4e416928d.jpg\",\"https://interiorlover.in/wp-content/uploads/2021/05/IMG_8876.jpg\",\"https://foliday-img.oss-cn-shanghai.aliyuncs.com/atlantis_website/screen/768/atlantis/sanya/image/restaurant-bars/Kaleidoscope/Kaleidoscope-c.jpg\"],\"time_to_visit\":\"2 hours\"}]},{\"day\":\"Day 5\",\"activities\":[{\"type\":\"Historical\",\"place_name\":\"Hampi Temple\",\"place_desc\":\"Hampi, the city of ruins, is a UNESCO World Heritage Site. Situated in the shadowed depth of hills and valleys, this place is a historical delight for travellers. Surrounded by 500 ancient monuments, beautiful temples, bustling street markets, bastions, treasury building and captivating remains of Vijayanagar Empire, Hampi is a backpackers delight. Hampi is an open museum with 100+ locations to explore and a favourite way to see the city from the perspective of its history.\",\"rating\":8,\"reviews\":4800,\"latlng\":\"27.7999999,75.999999\",\"images\":[\"https://upload.wikimedia.org/wikipedia/commons/4/4b/Hampi_virupaksha_temple.jpg\",\"https://c1.wallpaperflare.com/preview/218/702/416/narasimha-vigraha-ugra-narasimha-statue-sculpture.jpg\",\"https://i.pinimg.com/originals/21/51/08/215108040cfd2a6d5fa5af7bf1307147.jpg\",\"https://www.tourism-of-india.com/blog/wp-content/uploads/2021/06/Hemakuta-Hill-Temple-Complex.jpg\"],\"time_to_visit\":\"3 hours\"},{\"type\":\"Historical\",\"place_name\":\"ISKCON Temple\",\"place_desc\":\"ISKCON Sri Radha Krishna temple was inaugurated in the year 1997. It is not just a temple, but a cultural complex housing the temples dedicated to the Deities of Sri Sri Radha Krishnachandra, Sri Sri Krishna Balarama, Sri Sri Nitai Gauranga, Sri Srinivasa Govinda, Sri Prahlada Narasimha, Bhakta Hanuman, Garudadeva and Srila Prabhupada, Founder Acharya of ISKCON. \",\"rating\":8,\"reviews\":4571,\"latlng\":\"27.8999999,75.999999\",\"images\":[\"https://upload.wikimedia.org/wikipedia/commons/1/11/ISKCON_Banglaore_Temple.jpg\",\"https://a.travel-assets.com/findyours-php/viewfinder/images/res70/97000/97904-Iskcon-Temple.jpg\",\"https://e0.pxfuel.com/wallpapers/521/762/desktop-wallpaper-iskcon-krishna-iskcon-krishna-iskcon-krishna-for-your-mobile-tablet-explore-iskcon-krishna-for-of-lord-krishna-hare-krishna.jpg\",\"https://www.noblehousetours.com/wp-content/uploads/2017/04/Craft-of-Living-international-center-bangalore.jpg\"],\"time_to_visit\":\"3 hours\"}]},{\"day\":\"Day 6\",\"activities\":[{\"type\":\"Adventure\",\"place_name\":\"PUNO\",\"place_desc\":\"We at PUNO is India’s 1st Multifaceted Adventure & Trampoline Park, aiming to reflect the evolving cultural & lifestyle outlook of this heritage city in the modern era. It’s been more than 02 year since we opened our Gates to serve public at large comprising both kids and adults equally, thus prompting us to be a complete package destination equipped with an ADVENTURE ARENA & TRAMPOLINE PARK & our latest entrant PUNO – Junior, a dedicated multi-layered arena for our Junior Guests below the age of 7 years, wherein they can experience multiple rides, activities & games designed altogether keeping in mind the safety of all our guests across all the activities.\",\"rating\":7,\"reviews\":1700,\"latlng\":\"27.9999999,75.999999\",\"images\":[\"https://thespectrumworld.in/wp-content/uploads/2023/05/345079102_769316441501803_4708544652233958504_n.jpg\",\"https://media.dealzapp.in/property_images/OCT2021/16348027692-image.jpg?width=720&height=410\",\"https://funatpuno.com/wp-content/uploads/2023/10/PowerClip-Rectangle-3-1.png\"],\"time_to_visit\":\"6 hours\"},{\"type\":\"Relax\",\"place_name\":\"Truffles\",\"place_desc\":\"Truffles have built a reputation as one of the best family restaurants for having mean burgers and delicious steak. Out of all burger restaurants it is the best restaurants, probably, has the most amount of reserved tables for a fast-food joint.\",\"rating\":8,\"reviews\":4571,\"latlng\":\"28.1141522,76.1141115\",\"images\":[\"https://b.zmtcdn.com/data/pictures/0/51040/3614a681863f438e8a1018e313ed070f.jpg\",\"https://im.whatshot.in/img/2020/Mar/truffles1-1585623876.jpg\",\"https://im1.dineout.co.in/images/uploads/restaurant/sharpen/3/a/k/p3787-15261194715af6bc2f61433.jpg?tr=tr:n-medium\",\"https://www.fabhotels.com/blog/wp-content/uploads/2018/08/1400x600-25.jpg\"],\"time_to_visit\":\"2 hours\"}]},{\"day\":\"Day 7\",\"activities\":[{\"type\":\"Historical\",\"place_name\":\"Sanchi Stupa Temple\",\"place_desc\":\"The Great Stupa (also called stupa no. 1) was originally built in the 3rd century BCE by the Mauryan emperor Ashoka and is believed to house ashes of the Buddha. The simple structure was damaged at some point during the 2nd century BCE. It was later repaired and enlarged, and elements were added; it reached its final form in the 1st century BCE. The building is 120 feet (37 metres) wide and 54 feet (17 metres) high.\",\"rating\":7,\"reviews\":1700,\"latlng\":\"28.1781522,76.1141115\",\"images\":[\"https://www.inditales.com/wp-content/uploads/2009/09/sanchi-great-stupa.jpg\",\"https://www.mptourism.com/images/point-of-interest/sanchi-poi5.jpg\",\"https://live.staticflickr.com/3736/32895655504_2342fbc64c_b.jpg\"],\"time_to_visit\":\"2 hours\"},{\"type\":\"Historical\",\"place_name\":\"Lingaraja Temple\",\"place_desc\":\"Lingaraja Temple is a Hindu temple dedicated to Shiva and is one of the oldest temples. The temple is the most prominent landmark of the city and one of the major tourist attractions of the state.\",\"rating\":8,\"reviews\":4571,\"latlng\":\"28.2981522,76.1141115\",\"images\":[\"https://static.toiimg.com/thumb/56120203/lingraj.jpg?width=1200&height=900\",\"https://upload.wikimedia.org/wikipedia/commons/3/3d/Lingaraj_Temple_in_MahaShivratri.jpg\"],\"time_to_visit\":\"3 hours\"},{\"type\":\"Historical\",\"place_name\":\"Mahabodhi Temple\",\"place_desc\":\"The Mahabodhi Temple or the Mahābodhi Mahāvihāra, a UNESCO World Heritage Site, is an ancient, but rebuilt and restored Buddhist temple in India, marking the location where the Buddha is said to have attained enlightenment.\",\"rating\":8,\"reviews\":4571,\"latlng\":\"28.3991922,76.1141115\",\"images\":[\"https://lp-cms-production.imgix.net/2019-06/48853d4ff496fd4269c60e7f5c10ff0e-mahabodhi-temple.jpg\",\"https://drishtiias.com/images/uploads/1658304275_DrishtiIAS_English_Mahabodhi_temple_image7.jpg\",\"https://www.tripsavvy.com/thmb/CCrr8r-dyycw0kinajnaZ03vbVM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-638806428-f954eb5359404fa1b96c0d5894ee5ca6.jpg\"],\"time_to_visit\":\"4 hours\"}]}]}');
  dynamic get tripDetails => _tripDetails;
  set tripDetails(dynamic value) {
    _tripDetails = value;
    prefs.setString('ff_tripDetails', jsonEncode(value));
  }

  String _saveCategory = 'happy';
  String get saveCategory => _saveCategory;
  set saveCategory(String value) {
    _saveCategory = value;
    prefs.setString('ff_saveCategory', value);
  }

  int _activeIndex = 0;
  int get activeIndex => _activeIndex;
  set activeIndex(int value) {
    _activeIndex = value;
  }

  int _placeIndex = 0;
  int get placeIndex => _placeIndex;
  set placeIndex(int value) {
    _placeIndex = value;
  }

  List<dynamic> _tripHistory = [];
  List<dynamic> get tripHistory => _tripHistory;
  set tripHistory(List<dynamic> value) {
    _tripHistory = value;
    prefs.setStringList(
        'ff_tripHistory', value.map((x) => jsonEncode(x)).toList());
  }

  void addToTripHistory(dynamic value) {
    _tripHistory.add(value);
    prefs.setStringList(
        'ff_tripHistory', _tripHistory.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTripHistory(dynamic value) {
    _tripHistory.remove(value);
    prefs.setStringList(
        'ff_tripHistory', _tripHistory.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTripHistory(int index) {
    _tripHistory.removeAt(index);
    prefs.setStringList(
        'ff_tripHistory', _tripHistory.map((x) => jsonEncode(x)).toList());
  }

  void updateTripHistoryAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _tripHistory[index] = updateFn(_tripHistory[index]);
    prefs.setStringList(
        'ff_tripHistory', _tripHistory.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTripHistory(int index, dynamic value) {
    _tripHistory.insert(index, value);
    prefs.setStringList(
        'ff_tripHistory', _tripHistory.map((x) => jsonEncode(x)).toList());
  }

  List<int> _companionHistory = [];
  List<int> get companionHistory => _companionHistory;
  set companionHistory(List<int> value) {
    _companionHistory = value;
    prefs.setStringList(
        'ff_companionHistory', value.map((x) => x.toString()).toList());
  }

  void addToCompanionHistory(int value) {
    _companionHistory.add(value);
    prefs.setStringList('ff_companionHistory',
        _companionHistory.map((x) => x.toString()).toList());
  }

  void removeFromCompanionHistory(int value) {
    _companionHistory.remove(value);
    prefs.setStringList('ff_companionHistory',
        _companionHistory.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCompanionHistory(int index) {
    _companionHistory.removeAt(index);
    prefs.setStringList('ff_companionHistory',
        _companionHistory.map((x) => x.toString()).toList());
  }

  void updateCompanionHistoryAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _companionHistory[index] = updateFn(_companionHistory[index]);
    prefs.setStringList('ff_companionHistory',
        _companionHistory.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCompanionHistory(int index, int value) {
    _companionHistory.insert(index, value);
    prefs.setStringList('ff_companionHistory',
        _companionHistory.map((x) => x.toString()).toList());
  }

  int _companion = 0;
  int get companion => _companion;
  set companion(int value) {
    _companion = value;
  }

  List<DateTime> _dateHistory = [];
  List<DateTime> get dateHistory => _dateHistory;
  set dateHistory(List<DateTime> value) {
    _dateHistory = value;
    prefs.setStringList('ff_dateHistory',
        value.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void addToDateHistory(DateTime value) {
    _dateHistory.add(value);
    prefs.setStringList('ff_dateHistory',
        _dateHistory.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void removeFromDateHistory(DateTime value) {
    _dateHistory.remove(value);
    prefs.setStringList('ff_dateHistory',
        _dateHistory.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void removeAtIndexFromDateHistory(int index) {
    _dateHistory.removeAt(index);
    prefs.setStringList('ff_dateHistory',
        _dateHistory.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void updateDateHistoryAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    _dateHistory[index] = updateFn(_dateHistory[index]);
    prefs.setStringList('ff_dateHistory',
        _dateHistory.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void insertAtIndexInDateHistory(int index, DateTime value) {
    _dateHistory.insert(index, value);
    prefs.setStringList('ff_dateHistory',
        _dateHistory.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  List<dynamic> _tripFavourites = [];
  List<dynamic> get tripFavourites => _tripFavourites;
  set tripFavourites(List<dynamic> value) {
    _tripFavourites = value;
    prefs.setStringList(
        'ff_tripFavourites', value.map((x) => jsonEncode(x)).toList());
  }

  void addToTripFavourites(dynamic value) {
    _tripFavourites.add(value);
    prefs.setStringList('ff_tripFavourites',
        _tripFavourites.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTripFavourites(dynamic value) {
    _tripFavourites.remove(value);
    prefs.setStringList('ff_tripFavourites',
        _tripFavourites.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTripFavourites(int index) {
    _tripFavourites.removeAt(index);
    prefs.setStringList('ff_tripFavourites',
        _tripFavourites.map((x) => jsonEncode(x)).toList());
  }

  void updateTripFavouritesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _tripFavourites[index] = updateFn(_tripFavourites[index]);
    prefs.setStringList('ff_tripFavourites',
        _tripFavourites.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTripFavourites(int index, dynamic value) {
    _tripFavourites.insert(index, value);
    prefs.setStringList('ff_tripFavourites',
        _tripFavourites.map((x) => jsonEncode(x)).toList());
  }

  List<String> _tmpLatLng = [];
  List<String> get tmpLatLng => _tmpLatLng;
  set tmpLatLng(List<String> value) {
    _tmpLatLng = value;
  }

  void addToTmpLatLng(String value) {
    _tmpLatLng.add(value);
  }

  void removeFromTmpLatLng(String value) {
    _tmpLatLng.remove(value);
  }

  void removeAtIndexFromTmpLatLng(int index) {
    _tmpLatLng.removeAt(index);
  }

  void updateTmpLatLngAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _tmpLatLng[index] = updateFn(_tmpLatLng[index]);
  }

  void insertAtIndexInTmpLatLng(int index, String value) {
    _tmpLatLng.insert(index, value);
  }

  List<dynamic> _tmpDailyTripData = [];
  List<dynamic> get tmpDailyTripData => _tmpDailyTripData;
  set tmpDailyTripData(List<dynamic> value) {
    _tmpDailyTripData = value;
  }

  void addToTmpDailyTripData(dynamic value) {
    _tmpDailyTripData.add(value);
  }

  void removeFromTmpDailyTripData(dynamic value) {
    _tmpDailyTripData.remove(value);
  }

  void removeAtIndexFromTmpDailyTripData(int index) {
    _tmpDailyTripData.removeAt(index);
  }

  void updateTmpDailyTripDataAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    _tmpDailyTripData[index] = updateFn(_tmpDailyTripData[index]);
  }

  void insertAtIndexInTmpDailyTripData(int index, dynamic value) {
    _tmpDailyTripData.insert(index, value);
  }

  dynamic _jsondataSample = jsonDecode('null');
  dynamic get jsondataSample => _jsondataSample;
  set jsondataSample(dynamic value) {
    _jsondataSample = value;
  }

  dynamic _promptData = jsonDecode('{}');
  dynamic get promptData => _promptData;
  set promptData(dynamic value) {
    _promptData = value;
  }

  int _travelpartner = 0;
  int get travelpartner => _travelpartner;
  set travelpartner(int value) {
    _travelpartner = value;
  }

  String _selectedCity = '';
  String get selectedCity => _selectedCity;
  set selectedCity(String value) {
    _selectedCity = value;
  }

  dynamic _generatedJson;
  dynamic get generatedJson => _generatedJson;
  set generatedJson(dynamic value) {
    _generatedJson = value;
  }

  dynamic _jsondemmooo;
  dynamic get jsondemmooo => _jsondemmooo;
  set jsondemmooo(dynamic value) {
    _jsondemmooo = value;
  }

  String _city = '';
  String get city => _city;
  set city(String value) {
    _city = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
