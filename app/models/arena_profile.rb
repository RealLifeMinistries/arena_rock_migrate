# == Schema Information
#
# Table name: arena_profiles
#
#  profile_id                  :integer          not null, primary key
#  date_created                :datetime
#  date_modified               :datetime
#  created_by                  :string
#  modified_by                 :string
#  profile_type                :integer
#  organization_id             :integer
#  department_id               :integer
#  parent_profile_id           :integer
#  owner_id                    :integer
#  profile_name                :string
#  profile_desc                :string
#  notes                       :string
#  active                      :boolean
#  display_order               :integer
#  foreign_key                 :string
#  category_level              :boolean
#  blob_id                     :integer
#  qualifier                   :integer
#  owner_relationship_strength :integer
#  peer_relationship_strength  :integer
#  guid                        :uuid
#  campus_id                   :integer
#

class ArenaProfile < ArenaBase
  self.primary_key = 'profile_id'

  belongs_to :profile_type_record, class_name: "ArenaProfileType", foreign_key: :profile_type
  belongs_to :owner, class_name: "ArenaPerson"
  belongs_to :parent, class_name: "ArenaProfile", foreign_key: :parent_profile_id

  has_many :memberships, class_name: "ArenaProfileMember", foreign_key: :profile_id

  has_rock_mapping

  def sync_to_rock!
    if profile_type_record && profile_type_record.mapping # only sync if mapped type
      @map = mapping || build_mapping
      @rock = mapping.rock_record ||= RockGroup.new
      @rock.Guid ||= (guid || SecureRandom.uuid)
      @rock.IsSystem ||= false
      if parent_profile_id?
        @rock.ParentGroupId ||= parent.mapped_id
      else
        @rock.ParentGroupId ||= default_rock_parent_group_id
      end
      @rock.GroupTypeId ||= get_group_type_id#profile_type_record.mapping.#profile_type_record.mapped_id
      @rock.Name ||= profile_name
      @rock.Description ||= profile_desc
      @rock.IsActive ||= active?
      @rock.IsSecurityRole ||= false
      @rock.Order ||= display_order || 0
      @rock.CreatedDateTime ||= date_created
      @rock.ModifiedDateTime ||= date_modified
      @rock.save!
      @map.save!
      # add owner to group
      #sync_members
    end
  end

  ARENA_CLASSES = [3311,3515,3516,3513,3514,3512,3481,3462,3461,3460,3459,3457,3458,3397,3386,3366,3385,3383,3384,3365,3367,3368,3369,3326,3324,3325,3323,3322,3321,3320,3319,3316,3318,3317,3314,3315,3313,3312,3152,2862,3249,3248,3246,3245,3247,3213,3217,3218,3215,3216,3214,3211,3212,3209,3210,3108,3107,3109,3103,3104,3110,3111,3106,3112,3105,3067,3058,3053,3055,3054,3057,3050,3066,3052,3051,3048,3056,3226,3227,3022,3041,3042,1462,1463,1406,2285,2064,1916,1410,1409,1408,1407,1404,1415,2217,2772,2773,1279,2699,2370,2276,2275,2274,1214,788,1592,1671,1669,1667,1670,2388,1668,1672,1378,1380,1379,1381,2824,3027,2971,2825,3391,3028,3030,3223,3477,3478,3475,3476,3472,3473,3474,3392,3258,3259,3075,3351,3261,3262,3263,3257,3253,3254,3252,3238,3231,3202,3201,3076,3343,3339,3200,3095,3206,3151,3077,2695,2698,2696,2733,1282,3498,3467,3450,3371,2477,2478,2476,2457,2282,2102,2088,2009,1837,1764,1634,1461,1458,1036,585,2973,2591,2690,2688,3528,2691,2592,2590,1676,2295,2224,2071,1840,1741,1677,2428,2715,2711,2639,2633,2632,2638,2637,2631,2634,2636,2629,2630,2580,2587,2584,2585,2586,2588,2583,2581,2582,2579,2578,2430,2429,2433,2434,2435,2438,2437,2432,2440,2431,2436,2439,2505,2713,2496,2712,2501,2708,2499,2709,2502,2710,2497,2716,2495,2714,2504,2503,2801,2979,2995,2984,2988,2986,2985,2987,2996,2991,2989,2992,2999,2990,2974,2958,2962,2978,2965,2960,2959,2955,2963,2961,2964,2956,2957,2932,2900,2905,2908,2895,2899,2898,2906,2907,2903,2904,2897,2896,2914,2851,2853,2852,2856,2857,2855,2854,2858,2859,2860,2861,2803,2807,2802,2804,2809,2806,2812,2805,2808,2811,2810,1464,3225,3023,2982,2821,2682,2442,2299,2078,2077,1888,1673,1465,1283,1097,3155,1335,1674,2921,2814,2813,2577,2533,2443,2297,2269,2081,2144,2072,2076,1675,2223,1412,1414,1413,1455,1448,1449,787,2116,1831,2305,2296,2266,2268,2267,2225,2080,2120,2073,1885,1832,1684,1679,2317,2075,2079,1915,1904,1826,1721,1720,1719,1718,1717,1716,1683,1682,1681,1680,1700,1701,1886,1887,1833,2589,2367,2298,2294,2263,2264,2226,2074,1949,1834,1626,3402,3404,3408,3405,3403,3407,3406,3375,3379,3378,3377,3381,3380,3376,3353,3306,3304,3303,3307,3352,3357,3355,3310,3358,3356,3354,3309,3308,1456,1457,3044,3045]
  ARENA_EVENTS = [2554,2555,2460,2461,1753,2970,2458,2249,2022,1754,1755,1731,3455,2972,2940,2929,2997,2444,2616,2593,1556,2815,3069,3524,3525,3523,3526,3199,3000,2939,3522,2490,1841,3071,3070,1421,2737,2277,2463,2553,2251,3220,3219,2252,1973,3398,3396,3327,3097,3009,2844,2843,2472,2441,2459,2485,2487,1974,2488,2486,2484,2966,3328,3232,3229,3013,3014,3015,2983,2967,2643,2241,3196,3094,3004,2919,3029,1946,2021,1281,1069,1070,912]
  def get_group_type_id
    case profile_type_record.id
      when ArenaProfileType::PARTICIPANT
        return RockGroupType::PARTICIPANT_MINISTRY
      when ArenaProfileType::SERVING
        return RockGroupType::SERVING
      when ArenaProfileType::CLASSES_EVENTS
        if ARENA_CLASSES.include? parent_profile_id
          return RockGroupType::CLASS
        end
        if ARENA_EVENTS.include? parent_profile_id
          return RockGroupType::EVENT
        end
      else
        return nil
    end
  end
  def default_rock_parent_group_id
    case profile_type_record.id
      when ArenaProfileType::PARTICIPANT
        return RockGroup::PARTICIPANT_MINISTRY
      when ArenaProfileType::SERVING
        return RockGroup::SERVING_MINISTRY
      when ArenaProfileType::CLASSES_EVENTS
        if ARENA_CLASSES.include? id
          return RockGroup::CLASSES
        end
        if ARENA_EVENTS.include? id
          return RockGroup::EVENTS
        end
      else
        nil
    end
  end

  def sync_members
    memberships.each(&:sync_to_rock!)
  end

end
