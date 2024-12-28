{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
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
  pname = "autoware_internal_msgs";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."autoware_internal_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_internal_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_internal_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "3fd7826e215a521eb5abfa849e32fe000877a8c9";
        hash = "sha256-Vaq5hX6SH91HPNmjaP2Ddn9hsDaRj2inaWuFrozjUFU=";
      };
    };
  });
  meta = {
    description = "Autoware internal messages package.";
  };
})
