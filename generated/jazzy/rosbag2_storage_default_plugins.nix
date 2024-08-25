{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosbag2_storage_mcap,
  rosbag2_storage_sqlite3,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_storage_default_plugins = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_default_plugins-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "dc12d7706e00d42c49444bddb676bb8293b7cef3";
        hash = "sha256-Zk51LnlEeYOqq9VCDjrpxOQiq6Zb4vuOCl8Z6UZPLSE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_default_plugins";
  version = "0.26.4-1";
  src = sources.rosbag2_storage_default_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosbag2_storage_mcap rosbag2_storage_sqlite3 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Intermediate metapackage to point at default storage plugin(s) for rosbag2";
  };
}
