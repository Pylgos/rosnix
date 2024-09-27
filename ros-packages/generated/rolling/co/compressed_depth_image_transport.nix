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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    compressed_depth_image_transport-1363f91661bb5c75a098980c7217e017acc65733 = substituteSource {
      src = fetchgit {
        name = "compressed_depth_image_transport-1363f91661bb5c75a098980c7217e017acc65733-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "1363f91661bb5c75a098980c7217e017acc65733";
        hash = "sha256-f7U6pV7YQQOfBlgk355xZziYcWniLxfCpEP13+tYSRY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "compressed_depth_image_transport";
  version = "5.0.0-1";
  src = sources.compressed_depth_image_transport-1363f91661bb5c75a098980c7217e017acc65733;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge image_transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Compressed_depth_image_transport provides a plugin to image_transport for transparently sending depth images (raw, floating-point) using PNG compression.";
  };
}
