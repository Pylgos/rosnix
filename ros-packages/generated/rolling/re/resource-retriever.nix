{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libcurl-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "resource_retriever";
  version = "3.6.0-1";
  src = finalAttrs.passthru.sources."resource_retriever";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp ament-index-python libcurl-vendor ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "resource_retriever" = substituteSource {
      src = fetchgit {
        name = "resource_retriever-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "caf218019607e7dfe534514fda793a4a1e6d4a0f";
        hash = "sha256-jDJcmGbacnkBVZ9P/I4BZQp+o3lPcrnwziLPMmDZhJU=";
      };
    };
  });
  meta = {
    description = "This package retrieves data from url-format files such as http://, ftp://, package:// file://, etc., and loads the data into memory. The package:// url for ros packages is translated into a local file:// url. The resourse retriever was initially designed to load mesh files into memory, but it can be used for any type of data. The resource retriever is based on the the libcurl library.";
  };
})
