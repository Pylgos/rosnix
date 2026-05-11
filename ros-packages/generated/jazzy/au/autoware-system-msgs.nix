{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  autoware-common-msgs,
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
  version = "1.12.0-1";
  src = finalAttrs.passthru.sources."autoware_system_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ autoware-common-msgs builtin-interfaces diagnostic-msgs geometry-msgs nav-msgs rosidl-default-generators rosidl-default-runtime std-msgs unique-identifier-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ autoware-common-msgs builtin-interfaces diagnostic-msgs geometry-msgs nav-msgs rosidl-default-generators rosidl-default-runtime std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_system_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_system_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "b866bbc5115223273d1803c1232c4465c1154930";
        hash = "sha256-u+yA2qSb1IWlCYGAn2nO0dO6bNBkY1b0d0mkWdBIxHU=";
      };
    };
  });
  meta = {
    description = "Autoware system messages package.";
  };
})
