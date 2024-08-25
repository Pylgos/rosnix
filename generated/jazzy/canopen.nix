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
        rev = "f7ef32f1dd37b628c0f9fc1dc09a07d0367a0a2f";
        hash = "sha256-piA4LMW+Rk9PuHBjbD9oATPlP3AXOEIdCD5BxTH7jEo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen";
  version = "0.2.9-2";
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
