{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "autoware_sensing_msgs";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."autoware_sensing_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_sensing_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_sensing_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "fc08de04154178fd5907e2de86dfaaab9c0534bd";
        hash = "sha256-Iq9bZa/pfzHAdcqfqW9a7f3T3tRaw9fh+GPHXmEXV/8=";
      };
    };
  });
  meta = {
    description = "Autoware sensing messages package.";
  };
})
