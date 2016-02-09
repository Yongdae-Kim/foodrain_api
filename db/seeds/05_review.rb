require 'csv'

csv_text = ""

details = ['룰루랄라','천국의맛', '추천꾸욱', '추천합니다.','추운날은 궁물이죠', '음식이 정말 맛있어요~ 번창하세요.','마음씨도 따뜻해지네요', '배달의민족 주문~!', '새로 시작하는 테스트 리뷰','최고의 곳에서 최고의 음식을', '사랑하는 가족과 맛있는 음식을 먹는 것이 진짜 행복이죠','혹시 나가기 귀찮지 않으세요? 그럴때는 배달이죠', '먹는것이 행복이다.' '음식 남기지 맙시다.', '아까 먹었는데 또 치킨 먹고 싶네요','행복해요', 'ㅋㅋㅋㅋ', 'ㅎㅎㅎㅎ', '헤헤헷', '크크큭', '치킨은 사랑입니다','치느님', '역시 치킨은 BHC!!!', '입에 넣었더니 금방 사라졌어요ㅠㅜ', '사장님이 너무 친절해요', '추운날에도 배송해 주시고 감사합니다.', '서비스가 정말 좋네요.', '좋은 어플을 만들어 주셔서 감사합니다.', '테스트 리뷰입니다.', '배고플때는 짜장면~', '내일은 무엇을 시켜먹을까요?', '치소맥이 정말 맛있네요', '감사합니다.', '고맙습니다.', '번창하세요', '다음에 또 시켜 먹을게요', '좋은 곳에서 맛있는 음식을', '배달의 민족 인턴이 후기 남겨요', '반찬이 좀 짜네요ㅠㅠㅠ', '사장님 음식이 다 식어서 배달왔어요ㅠㅠ', '아니 젓가락이 안오면 어쩌자는 겁니까?', '음식 배달 잘못왔어요', '음식도 좋고 사장님도 좋고', '맛있어요', '숟가락 배달 안왔어요~', '맥주는 시켰는데 왜 안온거죠??ㅠㅠ', '메뉴가 다양해서 좋네요', '배달이 정말 빨라요', '굳', '짝짝짝!!!', '찌림찌림', '존맛임', '헐 여기 대박이에요', '억지리뷰', '양도 푸짐하고 맛있어요.', '사장님 리뷰 썼으니까 서비스 갖다주세요~', '맛 좋은 음식', '다음에 또 시킬게요', '먹어도 먹어도 질리지가 않네요', '제 점수는요~', '룸메형이랑 같이 먹었어요', '둘이 먹기에는 양이 좀 많아요','혀가 따갑네요.', '배달했는데 음식이 안오네요', '배송취소는 어떻게 히죠??', '음식이 내 스탈이에요', '두번째로 시켜먹는데 정말 좋네요.', '사장님 잘생겼어요', '배달 알바생 잘생겼어요', '비오는 날은 막걸리죠~', '소주랑 같이 먹으면 좋을 듯!!', '숟가락만 올려서 먹었어요', '영화 보면서 먹으면 허니잼', '개꿀임', '세트메뉴 쩔었음', '돌아온 억지리뷰', '1등', '2등', '3등', '비오는날은 파전인데ㅠㅠ', '오늘은 배달 안하나요?ㅠ', '다른지역도 배달해주세요', '저번에도 그랬는데 이번에도 숟가락 안왔어요', '친구에게도 추천해야겠어요', '쿨피스 안 갖다주세요?', '헐 핵 존존맛', '돌아온 테스트 리뷰입니다', '리뷰왕', '성지순례왔어요', '혹시 알바 안 구하세요?', '너무 매워요', '헐 너무 맵다', '좀 짜네요', '싱거운거 같아요', '혹시 간 하신거죠?ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ', 'ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ', 'ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ', 'ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ', '좋은 음식을 따듯한 집에서', '이불밖은 너무 위험해', '무한도전 보면서 먹는잼', '한국축구 할때는 배달음식이지', '오늘도 역시 맛있네요', '좋은 서비스 감사합니다.', '샤샤샷????', '굳굳굳!!!!', '쇠리질러~', '맛있지 않? ㄹㅇ? ㅇㅈ?','번창하시길 바랍니다.', '이런 진국같은 음식점들이 많아졌으면 좋겠네요', '이렇게 저렴하게 팔아서 이윤이 남을지 모르겠네요.', '가격대비 최고', '맛으로 승부하시는군요.', '호불호가 좀 갈리는 맛이네요.','전 괜찮았습니다만', '정말 싸요', '배달 수수료 붙나요?' ]

Dir[File.join(Rails.root, 'lib/csv', 'review', '*.csv')].each { |csv| csv_text << File.read(csv) }

csv = CSV.parse(csv_text, :headers => true)
csv.each_with_index do |row, index|
  t = Review.new
  t.store_id = rand(1...Store.all.size-1)
  t.user_id = row['user_id']
  t.detail = details[rand(1...details.size-1)]
  t.grade = row['grade']
  t.save
end