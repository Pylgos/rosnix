{
  ament-cmake-ros,
  buildCatkinPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-testing,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCatkinPackage (finalAttrs: {
  pname = "async_web_server_cpp";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."async_web_server_cpp";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "libssl-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libssl-dev" ]; };
  checkInputs = [ launch-testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-websocket" ]; };
  passthru.sources = mkSourceSet (sources: {
    "async_web_server_cpp" = substituteSource {
      src = fetchgit {
        name = "async_web_server_cpp-source";
        url = "https://github.com/ros2-gbp/async_web_server_cpp-release.git";
        rev = "a487340cedd199c2d33adec489e9a97e8cba04e7";
        hash = "sha256-ketLbXV9bdIyWx1waknk3IXQhZ2LwIgfe575dL2es4Y=";
      };
    };
  });
  meta = {
    description = "Asynchronous Web/WebSocket Server in C++";
  };
})
