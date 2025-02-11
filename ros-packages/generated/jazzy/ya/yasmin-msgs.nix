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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_msgs";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."yasmin_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "yasmin_msgs" = substituteSource {
      src = fetchgit {
        name = "yasmin_msgs-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "0719849bc7ddec9c93e4ba6834ae7033bfe2fbad";
        hash = "sha256-gBu31M8FitQ34kmCSjzoaAdglXJRlXA6GPBZC8PhVj0=";
      };
    };
  });
  meta = {
    description = "Msgs of (Yet Another State MachINe)";
  };
})
