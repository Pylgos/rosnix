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
  version = "1.0.4-1";
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
        rev = "bded79ba28a9d1a564c3079e592512c68ec1101d";
        hash = "sha256-qi8v76NED9jDMga+ozX2okajWVTxmwvi8x1rES0/vW8=";
      };
    };
  });
  meta = {
    description = "Provides interface descriptions to communicate with a SICK safeVisionary Sensor over ROS 2";
  };
})
