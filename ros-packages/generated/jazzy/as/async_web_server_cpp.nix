{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    async_web_server_cpp-82946dd9a58d8c6a924ae3464004272d467e5f63 = substituteSource {
      src = fetchgit {
        name = "async_web_server_cpp-82946dd9a58d8c6a924ae3464004272d467e5f63-source";
        url = "https://github.com/ros2-gbp/async_web_server_cpp-release.git";
        rev = "82946dd9a58d8c6a924ae3464004272d467e5f63";
        hash = "sha256-bz0je03yD60CjR08T++F1rGD5GhfXZJWAbL6L5rINbo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "async_web_server_cpp";
  version = "2.0.0-6";
  src = sources.async_web_server_cpp-82946dd9a58d8c6a924ae3464004272d467e5f63;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libssl-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ launch_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-websocket" ]; };
  meta = {
    description = "Asynchronous Web/WebSocket Server in C++";
  };
}
