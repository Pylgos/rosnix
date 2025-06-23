{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "naoqi_libqi";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."naoqi_libqi";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "libssl-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "libssl-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "naoqi_libqi" = substituteSource {
      src = fetchgit {
        name = "naoqi_libqi-source";
        url = "https://github.com/ros-naoqi/libqi-release.git";
        rev = "0c8a4622a66db58098e99def22ddcef773d8f85a";
        hash = "sha256-k0ytdv0Dc8cNcIjjhordFOVwDnZErPujPGCeKYeuLzw=";
      };
    };
  });
  meta = {
    description = "Aldebaran's libqi: a core library for NAOqiOS development";
  };
})
