{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sick_safevisionary_interfaces";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."sick_safevisionary_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "sick_safevisionary_interfaces" = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_interfaces-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_ros2-release.git";
        rev = "b9ffb0d8de52a56a4b444016433a83b7ab1dceaa";
        hash = "sha256-cQtk21EdiW4MK+2VAf7tRrKALFdTeSeBxlu3L2fKSsQ=";
      };
    };
  });
  meta = {
    description = "Provides interface descriptions to communicate with a SICK safeVisionary Sensor over ROS 2";
  };
})
