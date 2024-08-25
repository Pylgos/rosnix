{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    std_srvs = substituteSource {
      src = fetchgit {
        name = "std_srvs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "8fc86bed667466d9fc6f8d56c36be60bcc6f59f2";
        hash = "sha256-vZj9EDZ4Q3C4tcVlUQ7EJdMmxFJ6yAnuNdvztWjedfA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "std_srvs";
  version = "5.3.5-1";
  src = sources.std_srvs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "A package containing some standard service definitions.";
  };
}
