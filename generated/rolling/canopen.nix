{
  ament_cmake,
  buildRosPackage,
  canopen_402_driver,
  canopen_base_driver,
  canopen_core,
  canopen_interfaces,
  canopen_proxy_driver,
  fetchgit,
  fetchurl,
  fetchzip,
  lely_core_libraries,
  substituteSource,
}:
let
  sources = rec {
    canopen = substituteSource {
      src = fetchgit {
        name = "canopen-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "2295c5b5328ef7bb5ac8f10f956390d9fd405e80";
        hash = "sha256-sm7FaP2yTmcMeJhV7bqSBuDjGyDXyxt3MwaxCUyoi1s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen";
  version = "0.2.12-2";
  src = sources.canopen;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_402_driver canopen_base_driver canopen_core canopen_interfaces canopen_proxy_driver lely_core_libraries ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Meta-package aggregating the ros2_canopen packages and documentation";
  };
}
