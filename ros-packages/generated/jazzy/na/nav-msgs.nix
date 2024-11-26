{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav_msgs";
  version = "5.3.5-1";
  src = finalAttrs.passthru.sources."nav_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "nav_msgs" = substituteSource {
        src = fetchgit {
          name = "nav_msgs-source";
          url = "https://github.com/ros2-gbp/common_interfaces-release.git";
          rev = "296c753ed61df7932e9ddc07b399d9eb2f29fd7b";
          hash = "sha256-fSQ9CHh8TU+8S9dZkjjwH6zbyKtOdq/auWMvP7vPEKs=";
        };
      };
    });
  };
  meta = {
    description = "A package containing some navigation related message and service definitions.";
  };
})
