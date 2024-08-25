{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    point_cloud_msg_wrapper = substituteSource {
      src = fetchgit {
        name = "point_cloud_msg_wrapper-source";
        url = "https://github.com/ros2-gbp/point_cloud_msg_wrapper-release.git";
        rev = "0d85557d2e774b246906e7f020d65bf0b4720655";
        hash = "sha256-LiHXg+Jj7fMDItxqFAz8F5On1mitqVf18p4luIzXtWk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_msg_wrapper";
  version = "1.0.7-4";
  src = sources.point_cloud_msg_wrapper;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common geometry_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "A point cloud message wrapper that allows for simple and safe PointCloud2 msg usage";
  };
}
