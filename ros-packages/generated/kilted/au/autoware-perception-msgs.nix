{
  ament-cmake-auto,
  ament-lint-auto,
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
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_perception_msgs";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."autoware_perception_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs unique-identifier-msgs ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_perception_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_perception_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "1f8b94f8222dfc6c58a53903c39adefb271f11a8";
        hash = "sha256-OeICr01Y+8QxZZG3Rt4XAgzL9zwyrNoWv/sTlxg6W8I=";
      };
    };
  });
  meta = {
    description = "Autoware perception messages package.";
  };
})
