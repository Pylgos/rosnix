{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_system_msgs";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."autoware_system_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces diagnostic-msgs geometry-msgs nav-msgs rosidl-default-runtime std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_system_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_system_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "53289d622ada0aff50b42b333609d36214c2d937";
        hash = "sha256-MXGVQRXXOaj33DOrF8YC0tsELqA0wwsfEvvBMHykBqU=";
      };
    };
  });
  meta = {
    description = "Autoware system messages package.";
  };
})
