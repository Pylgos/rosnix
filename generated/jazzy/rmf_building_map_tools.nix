{
  ament_index_python,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_fuel_tools_vendor,
  libyamlcpp,
  python3Packages,
  rclpy,
  rmf_building_map_msgs,
  rmf_site_map_msgs,
  sqlite,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_building_map_tools = substituteSource {
      src = fetchgit {
        name = "rmf_building_map_tools-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "a6b0c09699bf074088d044d3d12641925b532289";
        hash = "sha256-4cUoJgBGbyqyS7tb68emxaWNBl+LdMnihmzy7xwvW90=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_building_map_tools";
  version = "1.9.1-1";
  src = sources.rmf_building_map_tools;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python gz_fuel_tools_vendor libyamlcpp python3Packages.fiona python3Packages.pyproj python3Packages.requests python3Packages.shapely rclpy rmf_building_map_msgs rmf_site_map_msgs sqlite std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ python3Packages.pytest ];
  missingDependencies = [ "python3-rtree" ];
  meta = {
    description = "RMF Building map tools";
  };
}
