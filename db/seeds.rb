admin = User.create!(
    first_name:"テスト",
    last_name:"管理者",
    nick_name:"リハモ",
    avatar_image:File.open(Rails.root + 'public/images/avatar.jpg'),
    introduction:"管理者をしています。みなさんと一緒に運動をして心身ともに健康な体を目指したと思います。相談があればメッセージをいただければと思います。よろしくお願いします。",
    email: "test@example.com",
    password:"111111",
    admin: true,
    confirmed_at: Time.now
  )

user1 = User.create!(
  first_name:"テスト1",
  last_name:"ユーザー1",
  nick_name:"アリス",
  avatar_image:File.open(Rails.root + 'public/images/avatar1.jpg'),
  introduction:"自主トレーニング頑張りたいと思い入会しました。趣味は登山です。最近足腰が弱ってきたので、スクワットを日課に体力の向上を目指していきたいと思います。",
  email: "alice@example.com",
  password:"111111",
  admin: false,
  confirmed_at: Time.now
)

user2 = User.create!(
  first_name:"テスト2",
  last_name:"ユーザー2",
  nick_name:"ジル",
  avatar_image:File.open(Rails.root + 'public/images/avatar2.jpg'),
  introduction:"趣味は料理と散歩です。最近は長い距離歩くと疲労感が出てきたため、下肢の運動と有酸素トレーニングを中心に筋力トレーニングを行なっていきたいと思います。。",
  email: "jill@example.com",
  password:"111111",
  admin: false,
  confirmed_at: Time.now
)

user3 = User.create!(
  first_name:"テスト3",
  last_name:"ユーザー3",
  nick_name:"マット",
  avatar_image:File.open(Rails.root + 'public/images/avatar3.jpg'),
  introduction:"趣味は読書です。最近、変形性膝関節症による両膝の痛みが出てきたので、膝関節の痛みを軽減のため下肢の筋力トレーニングを頑張ります。",
  email: "Mat@example.com",
  password:"111111",
  admin: false,
  confirmed_at: Time.now
)
user4 = User.create!(
  first_name:"テスト4",
  last_name:"ユーザー4",
  nick_name:"ポール",
  avatar_image:File.open(Rails.root + 'public/images/avatar4.jpg'),
  introduction:"最近、階段を登るのが大変になってきました。主治医からはスクワットをすると階段の上り下りの疲労が軽減していくと言われたので、習慣にしていきたいです。",
  email: "paulie@example.com",
  password:"111111",
  admin: false,
  confirmed_at: Time.now
)

user5 = User.create!(
  first_name:"テスト5",
  last_name:"ユーザー5",
  nick_name:"マンディ",
  avatar_image:File.open(Rails.root + 'public/images/avatar1.jpg'),
  introduction:"家の中の段差につまづき転倒してしまいました。リハビリの先生からふくらはぎの筋肉を鍛えると良いと指導されたので、継続して運動していきたいと思います。",
  email: "mandy@example.com",
  password:"111111",
  admin: false,
  confirmed_at: Time.now
)

#exercises
User.all.each do |user|
  user.exercises.create!(
    name: "歩行練習",
    description: "痛みや麻痺のある方は動画のように、歩行補助具を使用すると、両手の力で体重を分散することができるようになるので、負担を軽減して歩けるようになります。レンタルすることもできるので、ご自身のケアマネージャーに相談してみましょう。",
    image:File.open(Rails.root + 'public/images/image1.jpg'),
    video:File.open(Rails.root + 'app/assets/images/movie1.mp4'),
    minute: 10,
    second: 0,
    count: 0,
    set_count:0
  )
end

User.all.each do |user|
  user.exercises.create!(
    name: "広背筋のストレッチ",
    description: "座った姿勢が多いと固く、肩こりや猫背の原因となる筋肉の一つが広背筋です。写真のように片手を上げて体を倒してストレッチしていきます。動画のように肘を曲げて実施すると強くストレッチすることが出来ます。",
    image:File.open(Rails.root + 'public/images/image2.jpg'),
    video:File.open(Rails.root + 'app/assets/images/movie2.mp4'),
    minute: 0,
    second: 15,
    count: 1,
    set_count:2
  )
end

User.all.each do |user|
  user.exercises.create!(
    name: "ウォーキング",
    description: "少し普段より早歩きで、地面を蹴るように20分程度を目安に歩いてみましょう。病気が少なく健康的な生活を送ることができる歩数の目安は6000歩程度なので、それを目標に歩いていきましょう。",
    image:File.open(Rails.root + 'public/images/image3.jpg'),
    video:File.open(Rails.root + 'app/assets/images/movie3.mp4'),
    minute: 20,
    second: 0,
    count: 1,
    set_count:2
  )
end

User.all.each do |user|
  user.exercises.create!(
    name: "スクワット",
    description: "腰を真下に下ろすように、両膝を曲げていきましょう。膝を曲げる角度は、両膝がつま先より出ない程度まで行います。太ももと殿部の筋肉を意識して行なっていきましょう。",
    image:File.open(Rails.root + 'public/images/image4.jpg'),
    video:File.open(Rails.root + 'app/assets/images/movie4.mp4'),
    minute: 0,
    second: 0,
    count: 10,
    set_count:2,
  )
end

User.all.each do |user|
  user.exercises.create!(
    name: "股関節の外転運動",
    description: "歩行や階段昇降動作の安定や、膝関節の痛みの緩和に働く殿部の筋肉（中殿筋・大殿筋）を鍛えていきましょう。",
    image:File.open(Rails.root + 'public/images/image5.jpg'),
    video:File.open(Rails.root + 'app/assets/images/movie5.mp4'),
    minute: 0,
    second: 0,
    count: 10,
    set_count:2,
  )
end

#schedules
Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today + 7, 
  is_done: false
)
end
Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today + 6, 
  is_done: false
)
end
Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today + 5, 
  is_done: false
)
end
Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today + 4, 
  is_done: false
)
end

Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today + 3, 
  is_done: false
)
end

Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today + 2, 
  is_done: false
)
end

Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today + 1, 
  is_done: false
)
end

Exercise.all.each do |exercise|
    exercise.schedules.create!(
    fixed_day: Date.today, 
    is_done: false
  )
end

Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today - 1, 
  is_done: false
)
end

Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today - 2, 
  is_done: false
)
end

Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today - 3, 
  is_done: false
)
end

Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today - 4, 
  is_done: false
)
end

Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today - 5, 
  is_done: false
)
end

Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today - 6, 
  is_done: false
)
end

Exercise.all.each do |exercise|
  exercise.schedules.create!(
  fixed_day: Date.today - 7, 
  is_done: false
)
end

#conversation
conversation1 = Conversation.create!(
  sender_id: user1.id,
  recipient_id: user2.id
)

conversation2 = Conversation.create!(
  sender_id:  user1.id,
  recipient_id: user3.id
)
conversation3 = Conversation.create!(
  sender_id:  user1.id,
  recipient_id: user4.id
)

conversation4 = Conversation.create!(
  sender_id:  user1.id,
  recipient_id: user5.id
)
conversation5 = Conversation.create!(
  sender_id:  user2.id,
  recipient_id: user3.id
)

#messages
Message.create!(
  conversation_id: conversation1.id,
  user_id: user1.id,
  body:"初めまして",
  read: true 
)
Message.create!(
  conversation_id: conversation1.id,
  user_id: user2.id,
  body:"こちらこそ初めまして",
  read: false
)
Message.create!(
  conversation_id: conversation2.id,
  user_id: user1.id,
  body:"初めまして",
  read: true
)
Message.create!(
  conversation_id: conversation2.id,
  user_id: user3.id,
  body:"こちらこそ。運動一緒に頑張りましょう",
  read: false
)
Message.create!(
  conversation_id: conversation3.id,
  user_id: user1.id,
  body:"初めまして",
  read: true
)
Message.create!(
  conversation_id: conversation3.id,
  user_id: user4.id,
  body:"プロフィール拝見いたしました。運動一緒に頑張りましょう",
  read: false
)
Message.create!(
  conversation_id: conversation4.id,
  user_id: user1.id, 
  body:"初めまして",
  read: true
)
Message.create!(
  conversation_id: conversation4.id,
  user_id: user5.id, 
  body:"マンディです。こちらこそよろしくお願いします。",
  read: false
)
Message.create!(
  conversation_id: conversation5.id,
  user_id: user2.id, 
  body:"初めまして",
  read: true
)
Message.create!(
  conversation_id: conversation5.id,
  user_id: user3.id, 
  body:"初めましてマットです。",
  read: false
)