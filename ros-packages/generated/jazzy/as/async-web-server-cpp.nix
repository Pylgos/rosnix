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
  version = "2.0.0-6";
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
        rev = "82946dd9a58d8c6a924ae3464004272d467e5f63";
        hash = "sha256-bz0je03yD60CjR08T++F1rGD5GhfXZJWAbL6L5rINbo=";
      };
    };
  });
  meta = {
    description = "Asynchronous Web/WebSocket Server in C++";
  };
})
