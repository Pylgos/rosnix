{
  ament-cmake,
  ament-cmake-cppcheck,
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
  pname = "tuw_airskin_msgs";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."tuw_airskin_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_airskin_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_airskin_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "5f562c12992366ed6c2a1add5377af740f4af41a";
        hash = "sha256-8h8CzlxjNc6EPRTqKhLkhvfJUJG6C7OuNbYwuxTJsh4=";
      };
    };
  });
  meta = {
    description = "The tuw_airskin_msgs package";
  };
})
