using Ray.BiliBiliTool.Agent.Attributes;
using Ray.BiliBiliTool.Agent.Baihu.Dtos;
using WebApiClientCore.Attributes;

namespace Ray.BiliBiliTool.Agent.Baihu;

[LogFilter]
public interface IBaihuApi
{
    [HttpGet("/open2api/v1/env/all")]
    Task<BaihuGenericResponse<List<BaihuEnv>>> GetEnvsAsync(
        [Header("Authorization")] string token
    );

    [HttpPost("/open2api/v1/env")]
    Task<BaihuGenericResponse<BaihuEnv>> AddEnvAsync(
        [JsonContent] BaihuEnv env,
        [Header("Authorization")] string token
    );

    [HttpPut("/open2api/v1/env/{id}")]
    Task<BaihuGenericResponse<BaihuEnv>> UpdateEnvAsync(
        string id,
        [JsonContent] BaihuEnv env,
        [Header("Authorization")] string token
    );
}
