{
  ament-cmake-auto,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_common_msgs";
  version = "1.6.0-1";
  src = finalAttrs.passthru.sources."autoware_common_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_common_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_common_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "7e791eefc9cd56b5ffb32eb5d92a4c8d48636cf6";
        hash = "sha256-x8EHPFGlLv3ecx0mIjoLF421GAdLiryrkG6aBvXjG+o=";
      };
    };
  });
  meta = {
    description = "Autoware common messages package.";
  };
})
