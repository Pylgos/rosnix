{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_utils_math";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."autoware_utils_math";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_utils_math" = substituteSource {
      src = fetchgit {
        name = "autoware_utils_math-source";
        url = "https://github.com/ros2-gbp/autoware_utils-release.git";
        rev = "7a4263269cf79a87c95aef1ebd1595ec1b6ee6b7";
        hash = "sha256-XQb+DxbAiQue2TrVLeIt8okzko4EZ2Uoj/knEf+FUL4=";
      };
    };
  });
  meta = {
    description = "The autoware_utils_math package";
  };
})
