{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    pal_statistics_msgs-6c866cbe77d964560c81d9c184c06d1371661686 = substituteSource {
      src = fetchgit {
        name = "pal_statistics_msgs-6c866cbe77d964560c81d9c184c06d1371661686-source";
        url = "https://github.com/ros2-gbp/pal_statistics-release.git";
        rev = "6c866cbe77d964560c81d9c184c06d1371661686";
        hash = "sha256-8QGt/RdBUUO5MaWpDpaVy7xWuLywg94gm/Gmo1J8GiY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_statistics_msgs";
  version = "2.2.4-1";
  src = sources.pal_statistics_msgs-6c866cbe77d964560c81d9c184c06d1371661686;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Statistics msgs package";
  };
}
