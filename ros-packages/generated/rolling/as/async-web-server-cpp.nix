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
  version = "2.0.2-1";
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
        rev = "cd30d47e408f681e5b8b0bafaba5118876fa6711";
        hash = "sha256-A4opf7CTvfLjrzXYNeSjV395+7NqeT8Mx1WK5Cf2uLA=";
      };
    };
  });
  meta = {
    description = "Asynchronous Web/WebSocket Server in C++";
  };
})
