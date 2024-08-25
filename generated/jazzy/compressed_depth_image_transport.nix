{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  substituteSource,
}:
let
  sources = rec {
    compressed_depth_image_transport = substituteSource {
      src = fetchgit {
        name = "compressed_depth_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "1ee373a86d9f6274808fdb76777a7c5c32969cec";
        hash = "sha256-rvdMaYqnt0HV3RRnlb1xQHPu1Wuod7h3V0iP2XPl9uc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "compressed_depth_image_transport";
  version = "4.0.2-1";
  src = sources.compressed_depth_image_transport;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_transport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Compressed_depth_image_transport provides a plugin to image_transport for transparently sending depth images (raw, floating-point) using PNG compression.";
  };
}
