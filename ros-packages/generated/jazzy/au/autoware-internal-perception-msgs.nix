{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  autoware-perception-msgs,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_internal_perception_msgs";
  version = "1.8.1-1";
  src = finalAttrs.passthru.sources."autoware_internal_perception_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ autoware-perception-msgs builtin-interfaces rosidl-default-runtime sensor-msgs std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_internal_perception_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_internal_perception_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "86de593d18600bcad7994dde68ef93437343fc08";
        hash = "sha256-Q+IP1FGt6J25Bqj4ufPXp7fBWt8lfdcvcMCnhKu+h7c=";
      };
    };
  });
  meta = {
    description = "Autoware internal perception messages package.";
  };
})
