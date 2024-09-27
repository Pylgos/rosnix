{
  ament_cmake_ros,
  buildRosPackage,
  fastcdr,
  fastrtps,
  fastrtps_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  rcutils,
  rosSystemPackages,
  rosidl_dynamic_typesupport,
  substituteSource,
}:
let
  sources = rec {
    rosidl_dynamic_typesupport_fastrtps-52903997cf3540416b91aceb67484da9502a88f8 = substituteSource {
      src = fetchgit {
        name = "rosidl_dynamic_typesupport_fastrtps-52903997cf3540416b91aceb67484da9502a88f8-source";
        url = "https://github.com/ros2-gbp/rosidl_dynamic_typesupport_fastrtps-release.git";
        rev = "52903997cf3540416b91aceb67484da9502a88f8";
        hash = "sha256-/6hCwkM/wzvXaP4OPz5zHKYLJycpL+FPQY0UdW5Yj3U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_dynamic_typesupport_fastrtps";
  version = "0.2.0-1";
  src = sources.rosidl_dynamic_typesupport_fastrtps-52903997cf3540416b91aceb67484da9502a88f8;
  nativeBuildInputs = [ ament_cmake_ros fastrtps_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fastcdr fastrtps rcutils rosidl_dynamic_typesupport ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "FastDDS serialization support implementation for use with C/C++.";
  };
}
