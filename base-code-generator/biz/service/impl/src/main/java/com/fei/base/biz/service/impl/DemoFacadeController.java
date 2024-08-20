package com.fei.base.biz.service.impl;

import com.mengxiang.base.common.model.result.Result;
import com.fei.base.biz.server.manager.DemoManager;
import com.fei.base.service.facade.common.feign.DemoFacade;
import com.fei.base.service.facade.common.request.DemoRequest;
import com.fei.base.service.facade.common.result.DemoResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author fei
 * @date ${DATE}
 **/
@RestController
@Tag(name = "demo 服务接口", description = "demo相关的服务接口")
public class DemoFacadeController implements DemoFacade {

    @Autowired
    private DemoManager demoManager;

    @Override
    @Operation(summary = "get demo 接口", description = "get demo 接口")
    public Result<DemoResult> getDemo(@RequestParam("demoId") String demoId) {
        DemoResult demoResult = demoManager.selectDemoByDemoId(demoId);
        return Result.success(demoResult);
    }

    @Override
    public Result<String> addDemo(DemoRequest dto) {
        String demoId = demoManager.saveDemo(dto);
        return Result.success(demoId);
    }

}
