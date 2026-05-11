{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  shape-msgs,
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_adapi_v1_msgs";
  version = "1.9.1-1";
  src = finalAttrs.passthru.sources."autoware_adapi_v1_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-generators rosidl-default-runtime shape-msgs std-msgs unique-identifier-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-generators rosidl-default-runtime shape-msgs std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_adapi_v1_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_v1_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_adapi_msgs-release.git";
        rev = "49b86883e7a017f203954ae1922fccbf31c5f410";
        hash = "sha256-qkT06eok+kp9aRqyvy2gMRvSumphh9WZhqnuOYRUSv4=";
      };
    };
  });
  meta = {
    description = "The Autoware AD API interfaces";
  };
})
