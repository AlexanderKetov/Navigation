//
//  ProfileTableHederViewController.swift
//  Navigation
//
//  Created by 4444 on 17.04.2022.
//

import UIKit
import iOSIntPackage

struct PostS {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

class ProfileTableHederViewController: UIViewController {
    
    let imagePublisher = ImagePublisherFacade()
    
    var countTest:Int = 0
    
    let postsHabr: [PostS] = {
        var post1 = PostS(
            author: "UtrobinMV",
            description: "В Linux есть что-то неполноценное, и нет ничего лучше, чем Windows или, например, MacOS. Вы наверняка слышали такое мнение много раз. Я же считаю, что подобная оценка возникает из-за человеческих привычек. Однажды научившись работать с одной операционной системой, тяжело перейти на новую, или просто не хочется, ведь изучение ОС - долгий процесс. Нельзя просто так лишь в порыве страсти или минутного желания перейти на новую систему полностью, по-настоящему, так чтобы не ставить свою прошлую операционную систему на виртуальную машину, или как вторую (запасную) систему на своем ПК. Если вы готовы почувствовать себя студентом снова, я расскажу, что нужно сделать….",
            image: "1.jpg",
            likes: 4,
            views: 102)
        
        var post2 = PostS(
            author: "honyaki",
            description: "Материалом о разработке калькулятора на CSS и HTML, без файла JS, тега script и обработчиков событий в HTML делимся к старту курса по Fullstack-разработке на Python. За подробностями приглашаем под кат. Постановка задачи В проектах CSS часто в обычные статические HTML и CSS компилируются HAML и SCSS. Последние при этом применяются во многих сумасшедших проектах, но свой я решил не усложнять: взгляните на весь код.",
            image: "2.jpg",
            likes: 10,
            views: 316)
        
        var post3 = PostS(
            author: "Doberman2029",
            description: "Привет, в данном посте вы найдете перевод статьи Mangabo Kolawole, в которой пойдет речь о Test-Driven Development. Мы создадим крайне простое приложение на React по всем правилам. Первое правило Test-Driven Development (TDD) – это написание тестов перед написанием кода. Это звучит более интуитивно, когда мы говорим о разработке для бэкенда, если честно, но работает ли данная схема для фронтенда, в частности для React, что же, посмотрим.",
            image: "3.jpg",
            likes: 24,
            views: 414)
        
        var post4 = PostS(
            author: "TilekSamiev",
            description: "Год назад в Ютубе мне попался видеоклип на песню «Катарсис». Песня, скажем так, неплохая, но в мой плейлист она не попала. Меня заинтересовал, в первую очередь, тот факт, что там снялся писатель-фантаст и видеоблогер Сурен Цормудян, поклонником коего я являюсь. А недавно мне довелось связаться с самим автором песни — музыкантом по имени SERZH, и взять у него интервью.",
            image: "4.jpg",
            likes: 2,
            views: 85)
        
        var temp: [PostS] = [post1, post2, post3, post4]
        return temp
    }()
    
    var postScrollView = UIScrollView()
    private lazy var tablePost: UITableView = {
        var tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: String(describing: PostTableViewCell.self) )
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderView.self) )
//        tableView.estimatedRowHeight = 800
//        tableView.rowHeight = UITableView.automaticDimension //500
//        tableView.estimatedSectionHeaderHeight = 300
//        tableView.sectionHeaderHeight = UITableView.automaticDimension //почему-то не работает
        tableView.clipsToBounds = false
        return tableView
    }()
    
    let userServiceOut = CurrentUserService()
    let userServiceOutTest = TestUserService()
    private var userName: String = ""
    
    let headView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePublisher.subscribe(self)
        
        let postImages: [UIImage?] = [UIImage(named: "1.jpg"), UIImage(named: "2.jpg"), UIImage(named: "3.jpg"), UIImage(named: "4.jpg")]
        
        if postImages.isEmpty {
            return
        }
        let postImagesUnwrap = postImages.compactMap { $0 }
        
        imagePublisher.addImagesWithTimer(time: 2, repeat: 4, userImages: postImagesUnwrap)
        
        self.view.backgroundColor = .green
        
        self.view.addSubview(postScrollView)
        postScrollView.addSubview(tablePost)
        
        tablePost.tableHeaderView = headView
        
        if let header = tablePost.tableHeaderView {
            header.frame.size.height = 280
        }
        
        postScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),       //Top
            postScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),       //Left
            postScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor), //Right
            postScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor), //Bot
        ])
        
        tablePost.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tablePost.topAnchor.constraint(equalTo: postScrollView.topAnchor),             //Top
            tablePost.leadingAnchor.constraint(equalTo: postScrollView.leadingAnchor),     //Left
            tablePost.trailingAnchor.constraint(equalTo: postScrollView.trailingAnchor),   //Right
            tablePost.bottomAnchor.constraint(equalTo: postScrollView.bottomAnchor),       //Bot
            tablePost.widthAnchor.constraint(equalTo: postScrollView.widthAnchor),         //Width
            tablePost.heightAnchor.constraint(equalTo: postScrollView.heightAnchor)         //Heigh
        ])
        
    }
    
    func reloaduserName (userName: String) {
        self.userName = userName
        //передаем логин
        #if DEBUG
        headView.reloadUserData(userServiceIn: userServiceOutTest, userName: userName)
        #else
        headView.reloadUserData(userServiceIn: userServiceOut, userName: userName)
        #endif
        
    }
}

extension ProfileTableHederViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cnt = self.countTest //postsHabr.count
        
        return cnt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostTableViewCell.self), for: indexPath) as! PostTableViewCell
        cell.cellContentSetup(post: postsHabr[indexPath.row])
        return cell
    }
}

extension ProfileTableHederViewController: UITableViewDelegate {
    
}

extension ProfileTableHederViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        self.countTest = images.count
        tablePost.reloadData()
        print(countTest)
    }
}