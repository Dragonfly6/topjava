package ru.javawebinar.topjava.web.meal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.service.MealService;

import java.util.Collection;

import static ru.javawebinar.topjava.web.SecurityUtil.authUserId;
import static ru.javawebinar.topjava.util.ValidationUtil.assureIdConsistent;

@Controller
public class MealRestController {

    protected final Logger log = LoggerFactory.getLogger(getClass());
    private MealService service;

    @Autowired
    public void setService(MealService service) {
        this.service = service;
    }

    public Collection<Meal> getAll() {
        log.info("getAll");
        return service.getAll(authUserId());
    }

    public Meal get(int id){
        log.info("get {}", id );
        return service.get(authUserId(), id);
    }

    public void delete(int id){
        log.info("delete {}", id);
        service.delete(authUserId(), id);
    }

    public Meal save(Meal meal){
        log.info("save {}", meal);
        return service.save(authUserId(), meal);
    }

    public void update(Meal meal, int id){
        log.info("update {}", meal);
        assureIdConsistent(meal, id);
        service.update(authUserId(), meal);
    }
}